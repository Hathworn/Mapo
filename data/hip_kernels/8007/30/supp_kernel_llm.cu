#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use a single-dimensional kernel for better memory coalescing and simpler indexing
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if(i < N) {
        // Cache X[i*INCX] value to avoid redundant global memory access
        float val = X[i*INCX];
        if((val * val) < (ALPHA * ALPHA)) {
            X[i*INCX] = 0;
        }
    }
}