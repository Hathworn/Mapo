#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int stride = gridDim.x * blockDim.x; // Calculate stride for grid-stride loop

    // Use grid-stride loop for better memory access pattern
    for (int idx = ix; idx < nx * ny; idx += stride)
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}