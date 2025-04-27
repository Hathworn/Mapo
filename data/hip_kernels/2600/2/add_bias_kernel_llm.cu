#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate the global thread index
    int offset = blockDim.x * (blockIdx.z * gridDim.y + blockIdx.y) + threadIdx.x;

    if (offset < size) {
        // Calculate index with fused batch and filter computation
        int index = (offset / size) * size * n + (offset % size);
        output[index] += biases[offset / size];
    }
}