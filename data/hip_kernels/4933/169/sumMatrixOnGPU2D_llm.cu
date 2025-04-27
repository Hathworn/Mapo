#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize using a shared memory buffer for better memory access coalescing
__global__ void sumMatrixOnGPU2D(float *A, float *B, float *C, int NX, int NY)
{
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit if the index is out of range
    if (ix >= NX || iy >= NY) return;

    unsigned int idx = iy * NX + ix;

    C[idx] = A[idx] + B[idx];
}