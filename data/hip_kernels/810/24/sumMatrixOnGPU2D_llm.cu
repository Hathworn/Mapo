#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use 2D block and grid dimensions to optimize thread indexing
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < nx && iy < ny) // Ensure indices are within matrix dimensions
    {
        unsigned int idx = iy * nx + ix; // Efficient shared index calculation
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform the addition operation
    }
}