#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use flat 1D block index calculation for simplicity
    int stride = blockDim.x * gridDim.x; // Calculate stride for handling larger arrays
    for(int idx = i; idx < N; idx += stride) // Use loop for processing multiple elements
    {
        X[idx * INCX] *= ALPHA; // Multiply current element by ALPHA
    }
}