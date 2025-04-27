#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified grid calculation
    if(i < N) {
        float val = X[i * INCX]; // Cache value to reduce repetitive accesses
        if(val * val < ALPHA * ALPHA) {
            X[i * INCX] = 0;
        }
    }
}