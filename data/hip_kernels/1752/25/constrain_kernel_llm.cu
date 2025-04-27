#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Cache grid dimensions as constant expressions
    const int gridWidth = gridDim.x;
    const int blockWidth = blockDim.x;
    
    // Calculate global index
    int i = (blockIdx.x + blockIdx.y * gridWidth) * blockWidth + threadIdx.x;

    // Perform operation only if index is within bounds
    if (i < N) {
        float value = X[i * INCX];
        // Utilize clamps to optimize the constraint calculation
        X[i * INCX] = clamp(value, -ALPHA, ALPHA);
    }
}