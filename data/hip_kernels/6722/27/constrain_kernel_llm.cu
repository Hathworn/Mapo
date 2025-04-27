#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Enable coalesced memory access by striding through INCX
    int index = i * INCX;

    // Ensure the thread processes an element within bounds
    if(index < N) {
        X[index] = fminf(ALPHA, fmaxf(-ALPHA, X[index]));
    }
}