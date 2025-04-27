```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel implementation
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride-based approach to cover entire range
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x)
    {
        X[idx * INCX] *= ALPHA;
    }
}