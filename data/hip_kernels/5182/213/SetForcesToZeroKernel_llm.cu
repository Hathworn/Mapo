#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SetForcesToZeroKernel( float *force, int maxCells )
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation

    int stride = blockDim.x * gridDim.x; // Calculate stride based on grid and block size

    // Loop through the elements with a stride approach for larger data sets
    for(int i = threadId; i < maxCells * 3; i += stride) 
    {
        force[i] = 0.00f;
    }
}