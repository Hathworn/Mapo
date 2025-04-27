#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int *res, int k, int p, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Use block-wide bounds check to reduce divergence
    if (tid < n) {
        int temp = a[tid] + b[tid]; // Cache the sum in a temporary variable

        // Conditional assignment to minimize branch divergence
        res[tid] = (temp > k) ? p : temp;
    }
}