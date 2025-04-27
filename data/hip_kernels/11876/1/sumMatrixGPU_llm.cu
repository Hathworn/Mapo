#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate unique thread index within grid
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix < nx && iy < ny) {
        // Compute linear index for matrices
        unsigned int idx = iy * nx + ix;
        // Perform element-wise addition
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}