#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixOnGPU2D(float *A, float *B, float *C, int NX, int NY)
{
    // Calculate the global thread index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads do not access out-of-bounds memory
    if (ix < NX && iy < NY)
    {
        unsigned int idx = iy * NX + ix;
        // Perform addition operation
        C[idx] = A[idx] + B[idx];
    }
}