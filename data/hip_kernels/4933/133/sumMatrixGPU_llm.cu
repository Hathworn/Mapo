#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;
    
    // Ensure index is within bounds for both dimensions before computation
    if (ix < nx && iy < ny) 
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}