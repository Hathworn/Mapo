#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure i increments correctly by INCX
    i *= INCX;

    // Use grid-stride loop to allow more threads to contribute
    for (; i < N; i += blockDim.x * gridDim.x) {
        // Clamp X[i] to the range [-ALPHA, ALPHA]
        X[i] = fminf(ALPHA, fmaxf(-ALPHA, X[i]));
    }
}