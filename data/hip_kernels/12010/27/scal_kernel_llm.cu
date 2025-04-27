#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with stride to handle more elements per thread
    for(int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        X[idx * INCX] *= ALPHA;
    }
}