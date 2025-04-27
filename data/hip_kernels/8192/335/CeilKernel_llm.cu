#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CeilKernel(float* input, float* output, int size)
{
    // Calculate id using a more efficient computation
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * blockDim.y * blockIdx.y;

    // Check and compute if within bounds
    if(id < size)
    {
        output[id] = ceilf(input[id]); // Use ceilf for single precision
    }
}