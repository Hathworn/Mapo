#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calculateMatrixFormulaSharedStatic(int *a, int *b, int *res, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    if (tidx >= n || tidy >= n) {
        return;
    }

    int tid = tidx * n + tidy;

    // Use local variables for temporary storage to make better use of shared memory.
    __shared__ int s_a[size * size];
    __shared__ int s_b[size * size];

    s_a[tid] = a[tid];
    s_b[tid] = b[tid];
    __syncthreads(); // Ensure all threads have loaded data into shared memory

    // Perform calculation directly without additional shared memory usage.
    int result = s_a[tid] - s_b[tid];
    res[tid] = result;
}