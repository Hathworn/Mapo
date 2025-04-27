#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global thread index for 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Process all elements in this block
    while (i < n) { 
        c[i] += a[i] * b[i]; // Perform operation
        i += blockDim.x * gridDim.x; // Move to the next segment
    }
}