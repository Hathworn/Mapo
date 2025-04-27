#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate global index
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Combine index calculations
    unsigned int idx = iy * nx + ix;

    // Use single condition check
    if (idx < nx * ny)
    {
        MatC[idx] = MatA[idx] + MatB[idx];  // Perform element-wise addition
    }
}