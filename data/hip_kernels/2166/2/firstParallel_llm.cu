```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel with proper indexing
__global__ void firstParallel()
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (idx == 0) // Ensure only one thread does the work
    {
        printf("This is running in parallel.\n");
    }
}