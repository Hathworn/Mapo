#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GreaterThan(float * xf, bool * xb, size_t idxf, size_t idxb, size_t N)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds of the data
    if (i < N)
    {
        // Perform comparison operation
        xb[idxb*N + i] = xf[(idxf-1)*N + i] > xf[(idxf-2)*N + i];
    }
}