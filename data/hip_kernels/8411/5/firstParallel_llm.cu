#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void firstParallel()
{
    // Use blockIdx, blockDim, and threadIdx for better parallel execution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only one thread performs the print operation to avoid clutter
    if (idx == 0) {
        printf("This should be running in parallel.\n");
    }
}