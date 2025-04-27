#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Using blockDim.x and blockDim.y to improve memory access patterns
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = gridDim.x * blockDim.x; // Calculation once to reduce arithmetic

    // Loop to maximize utilization and prevent branching
    for (int i = idx; i < N; i += gridSize) {
        X[i * INCX] = ALPHA;
    }
}