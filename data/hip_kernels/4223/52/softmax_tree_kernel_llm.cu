#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    // Use shared memory to optimize memory access
    extern __shared__ float shared_mem[];
    float *e_values = shared_mem;
    float *largest_shared = shared_mem + n;

    int i = threadIdx.x;
    float sum = 0;

    // Find the largest element using parallel reduction
    largest_shared[0] = -INFINITY;
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i * stride];
        atomicMax(reinterpret_cast<int*>(&largest_shared[0]), __float_as_int(val));
    }
    __syncthreads();

    // Calculate exp values and sum them
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        e_values[i] = expf(input[i * stride] / temp - largest_shared[0] / temp);
        atomicAdd(&sum, e_values[i]);
    }
    __syncthreads();

    // Normalize exp values
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] = e_values[i] / sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;
    
    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    // Launch softmax_device kernel with shared memory size
    int shared_mem_size = group_size[g] * sizeof(float) + sizeof(float);
    softmax_device<<<1, 256, shared_mem_size>>>(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}