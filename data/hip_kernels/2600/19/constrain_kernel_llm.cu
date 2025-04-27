#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate a unique index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within the bounds
    if(i < N) {
        float val = X[i * INCX];  // Load the value once
        // Apply the constraint and store the result
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, val));
    }
}