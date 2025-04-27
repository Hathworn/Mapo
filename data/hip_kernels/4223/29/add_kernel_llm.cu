#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by performing coalesced reads/writes
    int stride = blockDim.x * gridDim.x;

    // Loop with strided access to allow processing of larger arrays with fewer blocks
    for (; i < N; i += stride) {
        X[i * INCX] += ALPHA;
    }
}