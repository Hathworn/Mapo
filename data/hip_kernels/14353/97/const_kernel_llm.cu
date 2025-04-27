#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize with loop unrolling for coalesced memory access
    int stride = blockDim.x * gridDim.x * INCX;
    for (int idx = i * INCX; idx < N; idx += stride) {
        X[idx] = ALPHA;
    }
}