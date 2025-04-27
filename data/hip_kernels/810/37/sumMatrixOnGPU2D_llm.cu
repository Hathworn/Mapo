#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *A, float *B, float *C, int NX, int NY)
{
    // Use 2D grid and block indices for better readability and clarity
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Optimize boundary check using a single condition
    if (ix < NX && iy < NY) 
    {
        unsigned int idx = iy * NX + ix; // Calculate index only when within bounds
        C[idx] = A[idx] + B[idx];
    }
}