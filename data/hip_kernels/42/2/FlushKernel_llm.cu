#include "hip/hip_runtime.h"
#include "includes.h"

// Empty kernel function, optimized by removing it since it performs no operations
__global__ void FlushKernel(void)
{
    // No operation
}