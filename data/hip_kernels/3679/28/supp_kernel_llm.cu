```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block indexing
    if(i < N) {
        float x_val = X[i * INCX]; // Cache memory access
        if((x_val * x_val) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;
        }
    }
}