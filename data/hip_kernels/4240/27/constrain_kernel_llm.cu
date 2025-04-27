```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index with improved readability
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Check and process only if within bounds
    if(i < N) {
        float val = X[i*INCX];
        // Use temporary variable for result
        X[i*INCX] = fminf(ALPHA, fmaxf(-ALPHA, val));
    }
}