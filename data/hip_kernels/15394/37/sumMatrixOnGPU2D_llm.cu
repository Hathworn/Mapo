#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *A, float *B, float *C, int NX, int NY)
{
    // Calculate 1D index based on local thread ID and ensure within bounds
    unsigned int idx = blockIdx.y * blockDim.y * NX + blockIdx.x * blockDim.x + threadIdx.y * NX + threadIdx.x;
    
    if (threadIdx.x + blockDim.x * blockIdx.x < NX && threadIdx.y + blockDim.y * blockIdx.y < NY)
    {
        C[idx] = A[idx] + B[idx];
    }
}