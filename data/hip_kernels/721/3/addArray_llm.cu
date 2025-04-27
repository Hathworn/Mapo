#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addArray(float *d_a, float *d_b, float *d_c, int size) 
{
    // Calculate global index
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure threads within bounds
    if (i < size) 
    {
        // Perform addition only if within bounds
        d_c[i] = d_a[i] + d_b[i];
    }
}