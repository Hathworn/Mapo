#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int *res, int k, int p, int n)
{
    // Optimize thread indexing calculations
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    if (idx < n && idy < n) {
        int tid = idx * n + idy; // Simplify linear indexing
        int temp_res = a[tid] + b[tid]; // Reduce global memory access
        res[tid] = (temp_res > k) ? p : temp_res; // Use ternary for conditional
    }
}