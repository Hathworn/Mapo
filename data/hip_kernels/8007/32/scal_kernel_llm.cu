#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better performance
    for (; i < N; i += blockDim.x * gridDim.x) {
        X[i * INCX] *= ALPHA;
    }
}