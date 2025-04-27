#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index to ensure thread safety
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over stride to improve utilization
    for (; i < N; i += blockDim.x * gridDim.x) {
        X[i * INCX] *= ALPHA;
    }
}