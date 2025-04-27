#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float activation_function(float x)
{
    return 1 / (1 + exp(-x));
}

__global__ void apply_activation_function(float *input, float *output, const int N)
{
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Process only valid indices
    if (idx < N) {
        output[idx] = activation_function(input[idx]);
    }
}