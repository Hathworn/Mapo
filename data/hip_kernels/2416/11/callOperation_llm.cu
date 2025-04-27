#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *res, int x, int n)
{
    // Calculate flattened thread ID and ensure within bounds in one step
    int tid = blockDim.x * blockIdx.x + threadIdx.x + 
              (blockDim.y * blockIdx.y + threadIdx.y) * n;
    // Boundary check combined for both grid and thread limits
    if (tid < n * n) {
        res[tid] = a[tid] * x; // Perform the operation
    }
}