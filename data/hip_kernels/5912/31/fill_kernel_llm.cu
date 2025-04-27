#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid for simple linear indexing
    int stride = blockDim.x * gridDim.x; // Calculate stride for 1D grid
    for (; i < N; i += stride) { // Loop with stride to process more elements
        X[i * INCX] = ALPHA;
    }
}