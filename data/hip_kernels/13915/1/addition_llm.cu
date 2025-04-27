#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel for better parallelization
__global__ void addition(int *a, int *b, int *c, int N)
{
    // Calculate global thread index for efficient parallel computation
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds before performing the addition
    if (tid < N) {
        c[tid] = a[tid] + b[tid];
    }
}