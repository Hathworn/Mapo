#include "hip/hip_runtime.h"
#include "includes.h"

// Using a more informative kernel name and simplifying the logic
__global__ void squareArrayOptimized(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) 
    {
        float val = a[idx]; // Load once
        a[idx] = val * val; // Compute square
    }
}