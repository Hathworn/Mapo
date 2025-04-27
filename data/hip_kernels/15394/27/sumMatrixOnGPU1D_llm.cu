#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Combine 2D threads into a single 1D thread ID
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int totalThreads = gridDim.x * blockDim.x;

    // Use a single loop for better memory access coalescing
    for (int i = idx; i < nx * ny; i += totalThreads)
    {
        MatC[i] = MatA[i] + MatB[i];
    }
}