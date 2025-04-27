#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddIntsCUDA(int *a, int *b) //Kernel Definition
{
    // Calculate global index for the single thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform addition only if index is 0 to ensure the operation is performed once
    if (idx == 0)
    {
        *a = *a + *b;
    }
}