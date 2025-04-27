#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize thread block indexing for better performance
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for multiple iterations
    for (int idx = i; idx < N; idx += stride)
    {
        X[idx * INCX] *= ALPHA;
    }
}