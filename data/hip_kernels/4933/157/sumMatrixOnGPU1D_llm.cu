#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Compute the global thread index for 1D grid
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use a single loop to iterate over both dimensions
    if (idx < nx * ny)
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}