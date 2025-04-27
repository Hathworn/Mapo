#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void callOperation(int *a, int *b, int *c, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    // Combine boundary checks to reduce branching
    if (tidx < n && tidy < n) 
    {
        int tid = tidx * n + tidy;
        c[tid] = max(a[tid], b[tid]); // Use max function for simplicity
    }
}