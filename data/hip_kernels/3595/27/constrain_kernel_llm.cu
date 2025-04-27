#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if(i < N) {
        float value = X[i*INCX];
        value = fminf(ALPHA, value); // Use temporary variable to store result
        value = fmaxf(-ALPHA, value);
        X[i*INCX] = value; // Write back result
    }
}