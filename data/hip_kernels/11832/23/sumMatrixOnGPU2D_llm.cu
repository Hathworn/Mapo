#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate global thread index
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Check if thread is within bounds
    if (ix >= nx || iy >= ny) return;
    
    // Calculate linear index
    unsigned int idx = iy * nx + ix;
    
    // Perform computation
    MatC[idx] = MatA[idx] + MatB[idx];
}