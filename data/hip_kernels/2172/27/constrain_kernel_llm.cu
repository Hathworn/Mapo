#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index considering potential 3D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Check bounds to avoid redundant computation
    if (i < N) {
        float value = X[i * INCX];
        value = (value > ALPHA) ? ALPHA : value;   // Apply upper bound
        value = (value < -ALPHA) ? -ALPHA : value; // Apply lower bound
        X[i * INCX] = value;
    }
}