#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized pow_kernel with improved memory access and parallelization
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Use 1D grid and block for better mapping
    int stride = gridDim.x * blockDim.x;  // Calculate stride for coalesced memory access
    for (int i = idx; i < N; i += stride) {  // Loop through elements using stride
        Y[i * INCY] = powf(X[i * INCX], ALPHA);  // Use powf for single precision floats
    }
}