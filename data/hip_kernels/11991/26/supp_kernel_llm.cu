#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use a 1D index for optimizing global memory access pattern
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if(idx < N) {
        // Pre-compute ALPHA^2 for reduced operations inside the loop
        float alphaSquared = ALPHA * ALPHA;
        float val = X[idx * INCX];
        
        // Optimization: use a temporary variable to store squared value
        float valSquared = val * val;

        if(valSquared < alphaSquared) {
            X[idx * INCX] = 0;
        }
    }
}