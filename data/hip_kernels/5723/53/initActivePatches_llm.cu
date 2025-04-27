#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initActivePatches(int* buffer, int num)
{
    // Check if index is within bounds and perform operation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < num)
        buffer[i] = i;
}