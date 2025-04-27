#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void vec_sinpi(int n, double *result, double *x)
{
    // Calculate one-dimensional global thread index directly
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread id is within bounds
    if (id < n)
    {
        // Direct computation of sinpi using input array
        result[id] = sinpi(x[id]);
    }
}