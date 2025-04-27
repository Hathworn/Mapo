#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for logarithm computation
extern "C"
__global__ void cuLog(int n, float *a, float *result)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure work is within bounds and perform operation
    if (i < n)
    {
        result[i] = logf(a[i]); // Use logf for float calculations
    }
}