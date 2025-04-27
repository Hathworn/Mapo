#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(int *MatA, int *MatB, int *MatC, int nx, int ny)
{
    // Calculate global thread coordinates
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Exit if thread is outside matrix bounds
    if (ix >= nx || iy >= ny) return;

    // Compute flattened index
    unsigned int idx = iy * nx + ix;

    // Sum corresponding elements of MatA and MatB
    MatC[idx] = MatA[idx] + MatB[idx];
}