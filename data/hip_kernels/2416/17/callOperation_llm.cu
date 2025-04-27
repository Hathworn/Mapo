#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int *res, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    // Combine index calculations and bounds check for efficiency
    if (tidx < n && tidy < n)
    {
        int tid = tidx * n + tidy;
        
        // Inline computation and conditional assignment using max function
        res[tid] = max(0, a[tid] - b[tid]);
    }
}