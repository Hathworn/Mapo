#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x; // Compute global x index
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y; // Compute global y index

    if (ix < nx && iy < ny) // Ensure indices are within bounds
    {
        unsigned int idx = iy * nx + ix; // Linearized index calculation
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform matrix addition
    }
}