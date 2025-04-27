#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x; // Calculate x index
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y; // Calculate y index
    unsigned int idx = iy * nx + ix;                         // Calculate global index

    if (ix < nx && iy < ny)  // Bound checking for matrix dimensions
        MatC[idx] = MatA[idx] + MatB[idx];  // Matrix addition
}