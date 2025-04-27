#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Optimize calculation of unique index for better performance
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds before accessing memory
    if (ix < nx && iy < ny)
    {
        unsigned int idx = iy * nx + ix;
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}