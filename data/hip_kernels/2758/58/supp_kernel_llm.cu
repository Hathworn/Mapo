#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    int stride = blockDim.x * gridDim.x;              // Calculate stride for efficient memory access

    for (int i = idx; i < N; i += stride) {           // Loop with stride to handle larger N sizes efficiently
        if ((X[i * INCX] * X[i * INCX]) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;
        }
    }
}