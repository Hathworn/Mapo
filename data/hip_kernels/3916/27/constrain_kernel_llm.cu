#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Flatten block index
    int stride = gridDim.x * blockDim.x;             // Calculate stride for grid loop

    for (int i = idx; i < N; i += stride) {          // Grid stride loop for efficiency
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i * INCX])); // Constrain value
    }
}