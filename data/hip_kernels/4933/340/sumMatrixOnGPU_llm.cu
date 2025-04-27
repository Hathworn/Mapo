#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use 2D indexing to clarify matrix element access
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < nx && iy < ny) // Ensure threads are within matrix bounds
    {
        unsigned int idx = iy * nx + ix; // Compute flattened index
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform element-wise addition
    }
}