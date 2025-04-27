#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *F, double *D)
{
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single thread to initialize shared data for efficiency
    if (tid == 0)
    {
        *F = 12.1f;  // Use 'f' suffix for float literals
        *D = 12.1;   // Double initialization is fine as-is
    }
}