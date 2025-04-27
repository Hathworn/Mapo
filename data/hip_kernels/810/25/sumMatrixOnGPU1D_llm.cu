#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Optimize to calculate both row and column indices using 2D grid
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Check boundaries for both x and y
    if (ix < nx && iy < ny) {
        int idx = iy * nx + ix;
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform element-wise addition
    }
}