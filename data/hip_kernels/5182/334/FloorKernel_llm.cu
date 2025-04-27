#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FloorKernel(float* input, float* output, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified global thread index calculation
    if(id < size)
    {
        output[id] = floorf(input[id]); // Use floorf for single precision float optimization
    }
}