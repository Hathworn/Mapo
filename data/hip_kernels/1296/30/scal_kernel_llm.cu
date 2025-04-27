#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize calculation of 'i' to use 1D grid
    int stride = blockDim.x * gridDim.x; // Calculate stride for coalesced access

    for (; i < N; i += stride) { // Process elements in a loop with stride
        X[i * INCX] *= ALPHA; // Optimize memory access pattern
    }
}