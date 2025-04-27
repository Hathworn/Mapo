#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clearLabel(bool *label, unsigned int size)
{
    // Calculate unique thread index
    unsigned int id = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Optimize control flow by using simplified condition
    if(id < size)
    {
        // Clear label using direct memory access
        label[id] = false;
    }
}