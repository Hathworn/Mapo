#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify indexing to 1D grid
    int stride = blockDim.x * gridDim.x;            // Calculate stride

    for (; i < N; i += stride) {                     // Use loop for memory coalescing
        X[i * INCX] += ALPHA;                        // Vectorized addition
    }
}