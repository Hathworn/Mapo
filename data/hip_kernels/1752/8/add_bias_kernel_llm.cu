#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate correct index instead of manually computing offset
    int index = (blockIdx.z * n + blockIdx.y) * size + blockIdx.x * blockDim.x + threadIdx.x;

    // Use a conditional check to ensure we don't exceed the limits
    if(index < (n * size)) {
        output[index] += biases[blockIdx.y];
    }
}