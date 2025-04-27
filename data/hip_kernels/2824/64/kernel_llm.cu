#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *F, double *D)
{
    // Use thread 0 of block 0 to initialize F and D
    if (blockIdx.x == 0 && threadIdx.x == 0)
    {
        *F = 12.1f;  // Use the correct type suffix for float
        *D = 12.1;   // Double type assignment is fine as is
    }
}