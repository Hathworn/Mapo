#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Optimize by using shared memory to reduce global memory access latency
    extern __shared__ float shared_X[];
    
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    if (i < N) {
        // Load data into shared memory
        shared_X[tid] = X[OFFX + i * INCX];
        __syncthreads();

        // Perform AXPY operation from shared memory
        Y[OFFY + i * INCY] += ALPHA * shared_X[tid];
    }
}