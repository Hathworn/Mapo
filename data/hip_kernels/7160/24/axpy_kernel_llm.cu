#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Flatten the block grid
    int stride = gridDim.x * blockDim.x;             // Define the stride for the loop

    for (int i = idx; i < N; i += stride) {          // Loop with stride for better workload distribution
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}