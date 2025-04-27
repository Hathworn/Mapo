#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int gridSize = blockDim.x * gridDim.x;           // Total number of threads across the grid
    while (idx < N) {                                // Loop through all necessary elements
        Y[idx * INCY] = powf(X[idx * INCX], ALPHA);  // Perform the power operation
        idx += gridSize;                             // Move to the next element this thread should handle
    }
}