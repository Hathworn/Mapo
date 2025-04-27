#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use shared memory for potentially faster access
    __shared__ float sMatA[32][32];
    __shared__ float sMatB[32][32];

    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    if (ix < nx && iy < ny)
    {
        // Load data into shared memory
        sMatA[threadIdx.y][threadIdx.x] = MatA[idx];
        sMatB[threadIdx.y][threadIdx.x] = MatB[idx];
        __syncthreads();  // Ensure both matrices are fully loaded

        // Perform addition using shared memory
        MatC[idx] = sMatA[threadIdx.y][threadIdx.x] + sMatB[threadIdx.y][threadIdx.x];
    }
}