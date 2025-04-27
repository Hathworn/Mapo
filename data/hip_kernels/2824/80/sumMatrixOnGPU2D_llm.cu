#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Use shared memory for better memory access efficiency
    extern __shared__ float sharedMemory[];
    float *sharedA = sharedMemory;
    float *sharedB = sharedA + blockDim.x * blockDim.y;

    unsigned int tx = threadIdx.x;
    unsigned int ty = threadIdx.y;
    unsigned int localIdx = ty * blockDim.x + tx;

    if (ix < nx && iy < ny)
    {
        unsigned int idx = iy * nx + ix;

        // Load data into shared memory
        sharedA[localIdx] = MatA[idx];
        sharedB[localIdx] = MatB[idx];

        // Ensure all threads have loaded their data
        __syncthreads();

        // Compute and store the result
        MatC[idx] = sharedA[localIdx] + sharedB[localIdx];
    }
}