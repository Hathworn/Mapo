#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use shared memory to load data for faster access
    extern __shared__ float sharedMem[];
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    if (ix < nx && iy < ny)
    {
        // Load data into shared memory
        sharedMem[threadIdx.y * blockDim.x + threadIdx.x] = MatA[idx];
        __syncthreads();  // Synchronize threads to ensure complete loading

        // Use shared memory for computation
        MatC[idx] = sharedMem[threadIdx.y * blockDim.x + threadIdx.x] + MatB[idx];
    }
}