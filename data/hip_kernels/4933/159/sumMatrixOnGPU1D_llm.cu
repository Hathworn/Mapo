#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int gridSize = blockDim.x * gridDim.x; // Calculate total number of threads processing columns

    // Use stride to process elements beyond the current block
    for (int idx = ix; idx < nx * ny; idx += gridSize)
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}