#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_add(float *a, float *b, float *c, int limit)
{
    // Calculate global thread ID
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Load data from global memory to registers for optimal access
    if (i < limit)
    {
        float a_val = a[i];
        float b_val = b[i];

        // Compute addition and store result
        c[i] = a_val + b_val;
    }
}