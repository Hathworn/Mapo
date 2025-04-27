#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output) 
{
    extern __shared__ float shared_output[]; // Shared memory buffer for intermediate output values
    int i;
    float sum = 0;
    float largest = -INFINITY;
    // Optimize loop with stride increment and shared memory
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i * stride];
        atomicMax_block(&largest, val); // Using atomic operation to find the maximum
    }
    __syncthreads(); // Ensure all threads have computed their largest
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float e = expf(input[i * stride] / temp - largest / temp);
        atomicAdd_block(&sum, e); // Atomic add to accumulate the sum
        shared_output[i * stride] = e; // Store intermediate output
    }
    __syncthreads(); // Wait for all threads to compute their exp
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] = shared_output[i * stride] / sum; // Normalizing the output
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
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
```
