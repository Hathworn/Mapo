#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation
    int stride = gridDim.x * blockDim.x; // Compute stride based on grid dimensions
    while (i < N) {
        X[i * INCX] = ALPHA; // Assign ALPHA to array element
        i += stride; // Move to next stride
    }
}