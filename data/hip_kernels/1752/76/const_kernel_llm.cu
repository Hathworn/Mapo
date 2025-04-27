#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; // Calculate global thread index
    int stride = gridDim.x * gridDim.y * blockDim.x; // Define stride for threads
    for(int i = idx; i < N; i += stride) // Use stride to cover all elements
    {
        X[i * INCX] = ALPHA; // Perform the operation
    }
}