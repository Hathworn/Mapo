#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int *c, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread is within bounds and prevent divergence
    if (tid < n) {
        c[tid] = max(a[tid], b[tid]); // Use max to simplify conditional
    }
}