#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    // Improved loop with parallel reduction for finding the largest value
    extern __shared__ float shared_data[];
    int tid = threadIdx.x;
    int index = tid * stride;

    shared_data[tid] = (index < n * stride) ? input[index] : -INFINITY;
    __syncthreads();

    // Parallel reduction to find max value
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_data[tid] = max(shared_data[tid], shared_data[tid + s]);
        }
        __syncthreads();
    }
    float largest = shared_data[0];
    
    // Compute softmax with improved memory read coalescing
    float sum = 0;
    if (index < n * stride) {
        float e = expf((input[index] - largest) / temp);
        atomicAdd(&sum, e);
        output[index] = e;
    }
    __syncthreads();

    // Normalize the output
    if (index < n * stride) {
        output[index] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (id >= spatial * batch * groups) return;
    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    // Allocate shared memory size for max reduction
    size_t shared_mem_size = blockDim.x * sizeof(float);
    
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}