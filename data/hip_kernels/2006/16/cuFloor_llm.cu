#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
extern "C"
__global__ void cuFloor(int n, float *a, float *b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Avoid out-of-bounds access
    if (i < n)
    {
        result[i] = fmaxf(a[i], b[i]); // Use fmaxf for better performance on floats
    }
}