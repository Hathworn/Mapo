#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c, int arrSize)
{
    int blockId = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    if (blockId < arrSize)
    {
        c[blockId] = a[blockId] + b[blockId];  // Add elements
    }
}