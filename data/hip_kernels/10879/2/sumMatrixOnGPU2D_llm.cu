#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(int *MatA, int *MatB, int *MatC, int nx, int ny)
{
    // Use shared memory for better memory access patterns
    __shared__ int sharedA[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int sharedB[BLOCK_SIZE][BLOCK_SIZE];

    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;
    
    // Load data into shared memory
    if (ix < nx && iy < ny) {
        sharedA[threadIdx.y][threadIdx.x] = MatA[idx];
        sharedB[threadIdx.y][threadIdx.x] = MatB[idx];
    }
    __syncthreads();

    // Perform addition
    if (ix < nx && iy < ny)
        MatC[idx] = sharedA[threadIdx.y][threadIdx.x] + sharedB[threadIdx.y][threadIdx.x];
}