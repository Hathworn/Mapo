#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid and block indexing
    int gridSize = blockDim.x * gridDim.x; // Calculate stride for loop

    for (; i < N; i += gridSize) { // Loop through elements with stride
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Utilize loop to handle more elements
    }
}