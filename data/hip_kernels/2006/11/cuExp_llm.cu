#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to compute exponentials
extern "C"
__global__ void cuExp(int n, float *a, float *result)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is within bounds
    if (i < n)
    {
        // Compute exponential and store the result
        result[i] = expf(a[i]); // Use expf for better performance on float
    }
}