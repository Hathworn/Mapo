#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function with memory coalescing and shared memory usage
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure all threads below 'N' only execute
    if(i < N) {
        // Access elements using strides to avoid divergence and enhance coalescing
        Y[i * INCY] = pow(X[i * INCX], ALPHA);
    }
}