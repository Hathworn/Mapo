#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index using 1D block and grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop to handle cases where INCX != 1 and utilize entire grid efficiently
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        X[idx * INCX] *= ALPHA;
    }
}