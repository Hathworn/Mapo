#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = blockIdx.y;
    unsigned int idx = iy * nx + ix;

    // Check if x and y coordinates are within matrix dimensions
    if (iy < ny && ix < nx)
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}