#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll the loop for efficiency
    int gridSize = blockDim.x * gridDim.x;
    while (i < N) {
        X[i * INCX] *= ALPHA;
        i += gridSize;
    }
}