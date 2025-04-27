#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index more directly
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    int stride = blockDim.x * gridDim.x;

    // Use strided loop for better performance on large arrays
    for (; i < N; i += stride) {
        X[i * INCX] += ALPHA;
    }
}