#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addMatrix(int *a, int *b, int *res, int n)
{
    // Calculate linear index directly
    int tid = blockDim.x * blockIdx.x + threadIdx.x + 
              (blockDim.y * blockIdx.y + threadIdx.y) * n;

    // Check if within bounds; perform addition if true
    if (tid < n * n) {
        res[tid] = a[tid] + b[tid];
    }
}