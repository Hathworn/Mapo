#include "hip/hip_runtime.h"
#include "includes.h"

// Use __restrict__ qualifiers for pointers to improve memory access efficiency
// Unroll loops when possible to reduce the loop overhead
__global__ void add_vector(int* __restrict__ a, int* __restrict__ b, int* __restrict__ c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {  // Ensure we don't go out of bounds
        c[i] = a[i] + b[i];
    }
}