#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}


__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate linear index
    int gridSize = gridDim.x * blockDim.x;          // Calculate total grid size

    while (i < N) {                                 // Loop over entire range
        X[i * INCX] *= ALPHA;                       // Scale element
        i += gridSize;                              // Move to next element in the grid
    }
}