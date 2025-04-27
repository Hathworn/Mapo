#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *F, double *D)
{
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Only one thread is responsible for updating *F and *D
    if (tid == 0)
    {
        *F = __float2half_rn(12.1f); // Use half-precision conversion
        *D = 12.1;
    }
}