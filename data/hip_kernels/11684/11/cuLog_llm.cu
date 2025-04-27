#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel with more concise code
extern "C"
__global__ void cuLog(int n, float *a, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if index is within bounds
    if (i < n) {
        result[i] = logf(a[i]); // Use logf for better performance with float
    }
}