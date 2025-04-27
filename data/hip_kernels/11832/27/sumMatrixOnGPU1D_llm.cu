#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Use 2D grid and block to handle 2D matrix operation more efficiently
    if (ix < nx && iy < ny)
    {
        int idx = iy * nx + ix;
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}