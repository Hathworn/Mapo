#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_reduce(int *c, int size)
{
    // Calculate unique thread index across the grid
    int idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    // Each thread reduces a pair of elements, if within size
    if (idx < size / 2)
    {
        if (c[idx] < c[idx + size / 2])
        {
            c[idx] = c[idx + size / 2];
        }
    }

    // Handle case for odd size by comparing the last element
    if (size % 2 != 0 && idx == 0)
    {
        if (c[0] < c[size - 1])
        {
            c[0] = c[size - 1];
        }
    }
}