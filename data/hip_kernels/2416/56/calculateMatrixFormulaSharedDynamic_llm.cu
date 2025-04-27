#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculateMatrixFormulaSharedDynamic(int *a, int *b, int *res, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    if (tidx >= n || tidy >= n) {
        return;
    }

    int tid = tidx * n + tidy;

    extern __shared__ int arrays[];

    int *s_a = arrays;
    int *s_b = &arrays[n * n];

    // Load data into shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];
    __syncthreads(); // Ensure all data is loaded before proceeding

    // Simple subtraction directly on shared memory
    res[tid] = s_a[tid] - s_b[tid];
}