```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate global thread index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within matrix bounds
    if (ix < nx && iy < ny) {
        unsigned int idx = iy * nx + ix; // Calculate linear global index
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform element-wise addition
    }
}