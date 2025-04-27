#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use blockIdx and blockDim to allow for larger vectors
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid out-of-bounds access
    if (i < N) {  // Assuming N is defined as the length of the vectors
        c[i] = a[i] + b[i];
    }
}