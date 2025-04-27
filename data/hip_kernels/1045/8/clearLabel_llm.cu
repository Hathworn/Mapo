#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clearLabel(bool *label, unsigned int size)
{
    // Calculate global thread ID
    unsigned int id = blockDim.x * blockIdx.x + threadIdx.x;

    // Use simple conditional to reduce overhead
    if (id < size)
    {
        label[id] = false;
    }
}