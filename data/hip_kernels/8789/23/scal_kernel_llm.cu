#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Stride loop to handle larger arrays
    for (int i = idx; i < N; i += blockDim.x * gridDim.x) {
        X[i*INCX] *= ALPHA;
    }
}