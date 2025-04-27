#include "hip/hip_runtime.h"
#include "includes.h"

// Improved constraint kernel for better performance
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate thread stride

    for (int i = idx; i < N; i += stride) { // Loop to cover entire data set
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i * INCX])); // Apply constraints
    }
}