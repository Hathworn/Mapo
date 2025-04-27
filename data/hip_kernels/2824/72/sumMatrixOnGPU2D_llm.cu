#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate global index
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Use shared memory for more efficiency
    __shared__ float tileA[TILE_SIZE][TILE_SIZE];
    __shared__ float tileB[TILE_SIZE][TILE_SIZE];

    // Check bounds and load data into shared memory
    if (ix < nx && iy < ny) {
        unsigned int idx = iy * nx + ix;
        tileA[threadIdx.y][threadIdx.x] = MatA[idx];
        tileB[threadIdx.y][threadIdx.x] = MatB[idx];
    }
    __syncthreads();  // Synchronize threads to ensure all data is loaded

    // Compute and write back result
    if (ix < nx && iy < ny) {
        unsigned int idx = iy * nx + ix;
        MatC[idx] = tileA[threadIdx.y][threadIdx.x] + tileB[threadIdx.y][threadIdx.x];
    }
}