#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize to avoid redundant calculation of (X[i*INCX] * X[i*INCX])
    if (i < N) {
        float value = X[i * INCX];
        if ((value * value) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;
        }
    }
}