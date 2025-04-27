#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate the unique thread ID
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure the thread is inside the bounds
    if (ix < nx && iy < ny)
    {
        // Calculate the linear index within the matrix
        unsigned int idx = iy * nx + ix;
        
        // Compute and store the sum of sines
        MatC[idx] = sin(MatA[idx]) + sin(MatB[idx]);
    }
}