#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate 2D thread index
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y; // Change y to threadIdx.y for 2D block
    unsigned int idx = iy * nx + ix;

    // Guard against out-of-bounds threads
    if (ix < nx && iy < ny)
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}