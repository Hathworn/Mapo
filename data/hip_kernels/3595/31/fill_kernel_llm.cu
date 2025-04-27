#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index in one step for better performance
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Ensure the loop only iterates required times using CUDA's built-in index handling
    if (i * INCX < N) {
        X[i * INCX] = ALPHA;
    }
}