#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Calculate unique thread ID
    int gridStride = gridDim.x * blockDim.x; // Calculate stride for grid stride loop
    float alphaSquare = ALPHA * ALPHA; // Pre-compute ALPHA squared
    
    for (int i = tid; i < N; i += gridStride) {
        float val = X[i * INCX];
        if (val * val < alphaSquare) {
            X[i * INCX] = 0;
        }
    }
}