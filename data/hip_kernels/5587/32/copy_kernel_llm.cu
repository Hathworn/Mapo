#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use a 1D block and grid for better performance
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop unrolling
    for (; i < N; i += stride) { // Loop unrolling for increased memory throughput
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}