#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D index calculation
    int gridSize = blockDim.x * gridDim.x; // Calculate the stride for the loop

    while(i < N) // Use loop to cover more indices
    {
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for float precision
        i += gridSize; // Move to the next set of indices
    }
}