#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calculateMatrixFormula(int *a, int *b, int *res, int n)
{
    // Calculate global thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x + (blockDim.y * blockIdx.y + threadIdx.y) * n;

    // Check if within matrix bounds
    if (tid < n * n) {
        res[tid] = a[tid] - b[tid];
    }
}