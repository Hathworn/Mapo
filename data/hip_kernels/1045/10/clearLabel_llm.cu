#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clearLabel(bool *label, unsigned int size)
{
    unsigned int id = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Unrolling the loop for better performance
    unsigned int gridSize = gridDim.x * blockDim.x;
    for (unsigned int i = id; i < size; i += gridSize)
    {
        label[i] = false;
    }
}