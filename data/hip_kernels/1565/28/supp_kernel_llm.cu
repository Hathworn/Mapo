#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure thread processes only valid elements
    if(i < N) {
        // Load value into a register
        float val = X[i * INCX];

        // Perform computation and write-back conditionally
        if(val * val < ALPHA * ALPHA) {
            X[i * INCX] = 0;
        }
    }
}