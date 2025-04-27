#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FloorKernel(float* input, float* output, int size)
{
    // Calculate global thread index using 1D grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread index is within bounds
    if (id < size)
    {
        output[id] = floorf(input[id]); // Use floorf for performance
    }
}