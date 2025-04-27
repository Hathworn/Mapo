#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique thread index in grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate total stride for grid-stride loop

    for (int i = idx; i < N; i += stride) { // Loop over all elements with step = stride
        X[i * INCX] = ALPHA; // Assign ALPHA to each element
    }
}