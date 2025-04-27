#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute 1D thread index
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid
    for (int idx = i; idx < N; idx += stride) // Loop over grid-stride
    {
        X[idx * INCX] += ALPHA; // Perform computation
    }
}