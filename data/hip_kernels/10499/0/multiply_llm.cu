#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void multiply(int n, float *a, float *b, float *sum)
{
    // Calculate thread index for current thread in grid.
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure index is within bounds to avoid invalid memory access.
    if (i < n)
    {
        sum[i] = a[i] * b[i]; // Perform element-wise multiplication.
    }
}