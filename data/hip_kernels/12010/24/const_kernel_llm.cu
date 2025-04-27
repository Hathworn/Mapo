#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Use a strided loop for more efficient memory access
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x * gridDim.y)
    {
        X[idx * INCX] = ALPHA;  // Assign ALPHA to element at the updated index
    }
}