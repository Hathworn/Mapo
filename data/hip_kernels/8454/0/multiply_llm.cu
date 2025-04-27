#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply(float *dest, float *a, float *b, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (i < n) // Avoid out-of-bounds memory access
    {
        dest[i] = a[i] * b[i];
    }
}