#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate the global index directly using 1D grid and block
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use i < n check to avoid out-of-bounds access
    if (i < n) {
        c[i] += a[i] * b[i]; // Perform the multiplication and addition
    }
}