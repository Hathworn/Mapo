#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global index using 1D grid and block layout
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread accesses only valid array indices
    if(i < n){
        c[i] += a[i] * b[i];
    }
}