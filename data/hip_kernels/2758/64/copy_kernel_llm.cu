#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D grid calculation
    int stride = blockDim.x * gridDim.x; // Compute stride for coalesced access

    // Loop over data with stride to ensure all elements are processed
    for (int index = i; index < N; index += stride) {
        Y[index * INCY + OFFY] = X[index * INCX + OFFX];
    }
}