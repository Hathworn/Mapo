#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify 1D grid index
    int stride = gridDim.x * blockDim.x;              // Calculate stride for looping

    for (int i = idx; i < N; i += stride)             // Loop over elements in increments of stride
    {
        X[i * INCX] *= ALPHA;                         // Scale the element by ALPHA
    }
}