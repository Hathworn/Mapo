#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique thread index globally
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Parallel iteration over elements handled by the thread with a loop
    for (int i = idx; i < N; i += blockDim.x * gridDim.x)
    {
        // Set X[i*INCX] to ALPHA
        X[i * INCX] = ALPHA;
    }
}