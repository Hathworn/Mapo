#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Compute unique index using threadIdx and blockIdx
    int index = blockIdx.z * n * size + blockIdx.y * size + blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check within bounds and apply bias scaling
    if(index < n * size) output[index] *= biases[blockIdx.y];
}