#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index with shared memory optimization
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < N) {
        int idx = i * INCX;
        X[idx] *= ALPHA;
    }
}