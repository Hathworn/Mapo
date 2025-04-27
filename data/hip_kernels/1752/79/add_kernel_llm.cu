#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid and block for simplicity
    int stride = gridDim.x * blockDim.x;          // Calculate stride for loop-based processing
    for (; i < N; i += stride)                    // Loop through elements with stride
    {
        X[i * INCX] += ALPHA;
    }
}