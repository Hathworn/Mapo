#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *A, float *B, float *C, int NX, int NY)
{
    // Calculate 1D index from 2D grid and block
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure index is within bounds
    if (ix < NX && iy < NY)
    {
        // Perform addition operation
        unsigned int idx = iy * NX + ix; // Compute index inside the if-statement
        C[idx] = A[idx] + B[idx];
    }
}