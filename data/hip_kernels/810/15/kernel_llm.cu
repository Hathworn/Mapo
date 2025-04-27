#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *F, double *D)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Only allow thread 0 in block 0 to execute this
    if (tid == 0 && blockIdx.x == 0)
    {
        *F = 12.1f;  // Use float literal for F
        *D = 12.1;   // Double literal for D
    }
}