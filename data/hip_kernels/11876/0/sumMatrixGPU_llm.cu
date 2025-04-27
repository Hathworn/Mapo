#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate global thread IDs
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check to ensure threads inside matrix boundaries
    if (ix < nx && iy < ny)
    {
        unsigned int idx = iy * nx + ix;  // Calculate linear index inside boundary check
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform matrix addition
    }
}