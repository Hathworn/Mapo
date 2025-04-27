#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Use shared memory for faster access
    extern __shared__ float shared_x[];
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    if (i < N) {
        // Load data into shared memory
        shared_x[threadIdx.x] = X[OFFX + i * INCX];
        __syncthreads();  // Ensure all threads have loaded their data

        // Perform the operation using shared memory
        Y[OFFY + i * INCY] += ALPHA * shared_x[threadIdx.x];
    }
}