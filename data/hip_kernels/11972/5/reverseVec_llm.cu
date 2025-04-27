#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void reverseVec(int n, float *a, float *b)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is in bounds
    if (i < n)
    {
        // Reverse copy from a to b
        b[n - 1 - i] = a[i];
    }
}