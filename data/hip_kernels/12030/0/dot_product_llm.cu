#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_product(float *a, float *b, float *c, int n)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    if (idx < n) { // Ensure index is within array bounds
        c[idx] = a[idx] * b[idx]; // Perform dot product at global index
    }
}