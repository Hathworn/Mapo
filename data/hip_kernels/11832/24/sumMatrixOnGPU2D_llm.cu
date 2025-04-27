#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate 2D thread index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Linearize 2D grid to 1D index
    if (ix < nx && iy < ny) {
        unsigned int idx = iy * nx + ix; // Calculation inside the if condition
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}