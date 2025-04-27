#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D grid mapping
    int stride = blockDim.x * gridDim.x;           // Calculate stride for 1D grid

    // Loop over elements with stride pattern to ensure all elements are processed in larger grids
    for (int index = i; index < N; index += stride) {
        X[index * INCX] += ALPHA;
    }
}