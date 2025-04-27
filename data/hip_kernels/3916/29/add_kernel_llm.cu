#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index using 3D grid and block dimensions directly
    int i = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x; 

    // Ensure to update only the elements within bounds
    if (i < N / INCX) {
        X[i * INCX] += ALPHA;
    }
}