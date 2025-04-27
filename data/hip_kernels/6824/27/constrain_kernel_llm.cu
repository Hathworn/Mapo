#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform operation only if index is within N
    if (i < N) {
        // Apply clamp using fminf and fmaxf to limit X[i*INCX] within [-ALPHA, ALPHA]
        float xi = X[i * INCX];
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, xi));
    }
}