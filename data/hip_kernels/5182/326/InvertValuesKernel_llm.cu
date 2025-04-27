#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InvertValuesKernel(float *input, float* outputs, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Process only valid indices
    if (id < size)
    {
        // Compute inverted value
        outputs[id] = 1.00f - input[id];
    }
}