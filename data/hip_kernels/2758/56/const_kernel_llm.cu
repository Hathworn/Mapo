#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index more efficiently 
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check if index is within bounds
    if (i < N) {
        X[i * INCX] = ALPHA;
    }
}