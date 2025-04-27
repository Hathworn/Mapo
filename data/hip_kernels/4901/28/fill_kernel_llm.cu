#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize for 1D grid and block
    int stride = gridDim.x * blockDim.x; // Calculate global stride
    for (int idx = i; idx < N; idx += stride) // Use stride loop for coalesced access
    {
        X[idx * INCX] = ALPHA;
    }
}