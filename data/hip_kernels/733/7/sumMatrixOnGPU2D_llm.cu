#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate unique thread index
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Simplified: bound check combined with quick return
    if (ix >= nx || iy >= ny) return;

    unsigned int idx = iy * nx + ix;

    // Perform the matrix addition
    MatC[idx] = MatA[idx] + MatB[idx];
}