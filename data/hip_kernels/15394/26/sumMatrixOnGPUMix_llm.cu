#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate unique thread index in the grid
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y; // Change to 2D indexing

    if (ix < nx && iy < ny) {
        unsigned int idx = iy * nx + ix; // Use ix and iy for indexing
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}