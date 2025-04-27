#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Use shared memory for faster access
    extern __shared__ float shared_input[];
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        shared_input[i] = input[i * stride];
    }
    __syncthreads();

    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float val = shared_input[i];
        atomicMax(&largest, val); // Determine the largest value
    }
    __syncthreads();

    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float e = expf(shared_input[i] / temp - largest / temp);
        atomicAdd(&sum, e); // Calculate the sum
        shared_input[i] = e;
    }
    __syncthreads();

    for (i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] = shared_input[i] / sum;
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

    // Use shared memory of appropriate size
    extern __shared__ float shared_memory[];
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}