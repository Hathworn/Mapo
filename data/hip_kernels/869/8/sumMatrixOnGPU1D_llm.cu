#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;

    // Use stride to handle whole matrix efficiently
    for (int idx = ix; idx < nx * ny; idx += blockDim.x * gridDim.x)
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}