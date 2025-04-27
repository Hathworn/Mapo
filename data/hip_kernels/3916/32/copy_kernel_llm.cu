#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global thread ID more efficiently by using only blockIdx.x
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to minimize global memory access
    __shared__ float shared_X[256];  // Assuming blockDim.x <= 256

    if (i < N)
    {
        // Load data into shared memory
        shared_X[threadIdx.x] = X[i * INCX + OFFX];

        // Make sure all threads have loaded their data
        __syncthreads();

        // Store data from shared memory to global memory
        Y[i * INCY + OFFY] = shared_X[threadIdx.x];
    }
}