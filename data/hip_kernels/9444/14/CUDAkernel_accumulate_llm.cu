#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with thread bounds checking
__global__ void CUDAkernel_accumulate(float* buffer, int addSize, int size)
{
    int index = CUDASTDOFFSET;

    // Ensure index is within buffer bounds
    if (index < size && index + addSize < size) 
    {
        float a = buffer[index];
        float b = buffer[index + addSize];
        
        buffer[index] = a + b; // Perform accumulation
    }
}