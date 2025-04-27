#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_cuda_fill_f32_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use block and thread indexes to calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds before performing computation
    if (idx < N) {
        X[idx * INCX] = ALPHA;
    }
}