#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int filter = blockIdx.y; // Cache bias index
    float bias = biases[filter];

    // Use a single loop to calculate the full index directly
    for(int offset = blockIdx.x * blockDim.x + threadIdx.x;
        offset < size;
        offset += blockDim.x * gridDim.x)
    {
        int index = (blockIdx.z * n + filter) * size + offset;
        output[index] += bias; // Apply bias within bounds
    }
}