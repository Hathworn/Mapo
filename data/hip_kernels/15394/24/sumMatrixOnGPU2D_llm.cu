#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate unique global thread ID
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads are within matrix bounds
    if (ix < nx && iy < ny) 
    {
        unsigned int idx = iy * nx + ix; // Compute linear index only for valid threads
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform element-wise addition
    }
}