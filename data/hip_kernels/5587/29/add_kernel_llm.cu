#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index based on the optimized 2D grid and block configuration.
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we process only valid elements within the matrix.
    if (i < N) 
    {
        // Perform the addition operation directly.
        X[i * INCX] += ALPHA;
    }
}