#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel for matrix summation
__global__ void sumMatrixOnGPU2DBlock2DGrid(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate global thread index for x and y dimensions
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Compute 1D index from 2D coordinates
    unsigned int idx = iy * nx + ix;

    // Check boundaries and perform addition only if within bounds
    if (ix < nx && iy < ny)
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}