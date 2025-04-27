#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate row and column for the current thread
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure thread index does not exceed matrix dimensions
    if (ix < nx && iy < ny) {
        unsigned int idx = iy * nx + ix; // Calculate global index
        MatC[idx] = MatA[idx] + MatB[idx]; // Element-wise addition of matrices
    }
}