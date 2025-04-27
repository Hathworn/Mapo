#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Cache blockDim.x in a local variable for reuse
    unsigned int blockDimX = blockDim.x;

    // Calculate the global index for the x direction
    unsigned int ix = threadIdx.x + blockIdx.x * blockDimX;

    // Calculate the global index for the y direction
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate the flattened index
    unsigned int idx = iy * nx + ix;

    // Check boundary conditions to avoid accessing invalid memory
    if (ix < nx && iy < ny)
    {
        // Perform element-wise addition
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}