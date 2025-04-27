#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate row index
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    // Calculate column index
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int idx = iy * nx + ix;
    
    // Check boundaries and perform addition
    if (ix < nx && iy < ny) {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}