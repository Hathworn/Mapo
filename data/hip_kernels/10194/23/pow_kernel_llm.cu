#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use one-dimensional blockIdx layout
    int gridSize = blockDim.x * gridDim.x; // Calculate grid size

    while (i < N) { // Loop to handle more data than threads
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for single precision
        i += gridSize; // Increment index to next data chunk
    }
}