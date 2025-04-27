#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate the global index for the thread
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure the thread operates within matrix bounds
    if (ix < nx && iy < ny)
    {
        unsigned int idx = iy * nx + ix; // Compute the flat index
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform element-wise addition
    }
}