#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize with cooperative grid-stride loops
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = index; i < N; i += stride) {
        X[i * INCX] *= ALPHA;
    }
}