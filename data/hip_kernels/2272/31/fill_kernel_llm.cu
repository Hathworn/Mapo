#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate index using improved formula for better readability
    int i = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    // Ensure that each thread checks its boundary condition
    if (i < N) X[i * INCX] = ALPHA;
}