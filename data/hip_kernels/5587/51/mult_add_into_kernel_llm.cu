#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use one-dimensional grid and streamline index calculations
    if (i < n) {
        // Optimize computation by directly accessing global index
        c[i] += a[i] * b[i];
    }
}