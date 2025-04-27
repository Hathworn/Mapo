#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate thread index using block and grid dimensions
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure thread index is within bounds
    if (i * INCX < N) {
        X[i * INCX] = ALPHA;
    }
}