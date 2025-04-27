#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize power kernel using efficient access pattern
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop through every element with stride for better utilization
    for (int i = idx; i < N; i += stride) {
        Y[i * INCY] = powf(X[i * INCX], ALPHA);
    }
}