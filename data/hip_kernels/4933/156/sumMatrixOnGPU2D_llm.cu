#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Get global thread index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Cache computation outside of condition
    unsigned int idx = iy * nx + ix;
    
    // Check within bounds
    if (ix < nx && iy < ny) {
        // Perform addition
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}