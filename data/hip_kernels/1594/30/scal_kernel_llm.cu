#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index directly, avoiding redundant grid calculations
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Step through the vector with strided increments if necessary
    for (int i = idx; i < N; i += blockDim.x * gridDim.x) {
        X[i * INCX] *= ALPHA;
    }
}