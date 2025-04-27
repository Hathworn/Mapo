#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Use a 2D grid and 2D blocks to better utilize GPU resources
    if (ix < nx && iy < ny)
    {
        int idx = iy * nx + ix;
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}