#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void add(int *a, int *b, int *c)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index
    c[idx] = a[idx] + b[idx]; // Use global index to access array elements
}