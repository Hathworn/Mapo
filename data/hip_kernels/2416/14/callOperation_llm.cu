#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void callOperation(int *a, int *b, int *res, int n)
{
    // Calculate global thread index
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check if within bounds and compute result
    if (tid < n) 
    {
        int temp = a[tid] - b[tid];  // Calculate subtraction once
        res[tid] = max(temp, 0);     // Use max to avoid conditional
    }
}