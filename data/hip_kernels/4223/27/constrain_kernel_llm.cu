#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure no out-of-bounds memory access
    if(i < N)
    {
        // Clamp the value using ALPHA
        int idx = i * INCX;
        float val = X[idx];
        X[idx] = fminf(ALPHA, fmaxf(-ALPHA, val));
    }
}