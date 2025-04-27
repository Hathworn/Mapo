#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function using grid-stride loop for better performance
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for(; i < N; i += stride) {
        X[i*INCX] *= ALPHA;
    }
}