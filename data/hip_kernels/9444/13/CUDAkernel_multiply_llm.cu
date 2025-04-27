#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CUDAkernel_multiply(float* sourceA, float* sourceB, float* destination, int size)
{
    int index = CUDASTDOFFSET;

    // Load data only if within bounds
    if (index < size)
    {
        float a = sourceA[index];
        float b = sourceB[index];
        destination[index] = a * b;
    }
}