```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate each thread's data point in the matrix more efficiently
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix < nx && iy < ny) {
        unsigned int idx = iy * nx + ix; // Compute index only if within bounds
        MatC[idx] = MatA[idx] + MatB[idx]; // Directly perform addition
    }
}