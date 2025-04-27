#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel using shared memory for parallel computations
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute the linear index of a thread within a block

    if(i < N) {
        // Load value into a register for quick access
        float xi = X[i * INCX];

        // Apply constraints using fminf and fmaxf functions
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, xi));
    }
}