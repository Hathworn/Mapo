#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use striding to allow threads to process multiple elements
    for (; i < N; i += gridDim.x * blockDim.x) {
        // Clamp X[i*INCX] to the range [-ALPHA, ALPHA]
        X[i*INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i*INCX]));
    }
}