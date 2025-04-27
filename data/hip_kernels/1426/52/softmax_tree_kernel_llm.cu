#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_THREADS_PER_BLOCK 256

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    float e;

    // Use shared memory to optimize access speed
    extern __shared__ float shared_mem[];
    float* shared_input = shared_mem;

    // Load input into shared memory
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        shared_input[i * stride] = input[i * stride];
    }
    __syncthreads();

    // Find the largest in shared memory for numerical stability
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float val = shared_input[i * stride];
        atomicMax((int*)&largest, __float_as_int(val));
    }
    __syncthreads();

    // Compute exponentials and sum
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        e = expf(shared_input[i * stride] / temp - largest / temp);
        atomicAdd(&sum, e);
        output[i * stride] = e;
    }
    __syncthreads();

    // Normalize the output
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;
    
    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    // Launch kernel with appropriate shared memory size
    int shared_mem_size = group_size[g] * sizeof(float);
    softmax_device<<<1, MAX_THREADS_PER_BLOCK, shared_mem_size>>>(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}