#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the thread's global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop to process larger arrays
    int stride = gridDim.x * blockDim.x;
    
    // Ensure all threads work on valid elements only
    for (; i < N; i += stride) {
        X[i * INCX] += ALPHA;
    }
}