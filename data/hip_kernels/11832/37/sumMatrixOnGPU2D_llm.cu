#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *A, float *B, float *C, int NX, int NY)
{
    // Use shared memory for faster access
    extern __shared__ float sData[];

    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int idx = iy * NX + ix;

    if (ix < NX && iy < NY)
    {
        // Load data into shared memory
        sData[threadIdx.y * blockDim.x + threadIdx.x] = A[idx] + B[idx];

        // Ensure all threads have written their data
        __syncthreads();

        // Write the result back to global memory
        C[idx] = sData[threadIdx.y * blockDim.x + threadIdx.x];
    }
}