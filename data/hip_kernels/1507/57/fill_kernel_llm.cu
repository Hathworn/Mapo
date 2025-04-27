#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x; // Simplified 1D block calculation
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid loops
    for(int i = tid; i < N; i += stride) // Loop to cover all elements
    {
        X[i * INCX] = ALPHA; // Fill array with ALPHA
    }
}