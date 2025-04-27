#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Use a 1D grid and block calculation for improved efficiency
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < n){
        // Perform the operation only for valid indices
        c[i] += a[i] * b[i];
    }
}