#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixOnGPU2D(int *MatA, int *MatB, int *MatC, int nx, int ny)
{
    // Calculate the unique thread index across the grid
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Calculate the linear index of the matrix element
    unsigned int idx = iy * nx + ix;

    // Ensure threads work only on valid indices
    if (ix < nx && iy < ny) {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}