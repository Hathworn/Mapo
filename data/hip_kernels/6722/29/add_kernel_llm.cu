#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the unique thread index in the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Process corresponding elements only within bounds
    if (i < N) {
        X[i * INCX] += ALPHA;
    }
}