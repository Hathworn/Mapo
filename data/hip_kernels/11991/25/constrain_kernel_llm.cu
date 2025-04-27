#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel to constrain values
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // If the index is valid
    if (i < N) {
        // Compute the effective index considering the increment
        int idx = i * INCX;
        // Apply constraints to the value in X
        X[idx] = fminf(ALPHA, fmaxf(-ALPHA, X[idx]));
    }
}