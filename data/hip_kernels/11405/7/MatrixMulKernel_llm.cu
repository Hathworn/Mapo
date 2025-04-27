#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 16  // Define tile size

__global__ void MatrixMulKernel(float *d_x, float *d_y, float *d_z, int Width) {

    // Define shared memory for tiles
    __shared__ float tile_x[TILE_SIZE][TILE_SIZE];
    __shared__ float tile_y[TILE_SIZE][TILE_SIZE];

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;

    float kernelSum = 0;

    if (idx < Width && idy < Width) {
        for (int t = 0; t < Width / TILE_SIZE; ++t) {
            // Load tiles into shared memory
            tile_x[threadIdx.y][threadIdx.x] = d_x[idy * Width + (t * TILE_SIZE + threadIdx.x)];
            tile_y[threadIdx.y][threadIdx.x] = d_y[(t * TILE_SIZE + threadIdx.y) * Width + idx];
            __syncthreads();  // Synchronize to ensure complete tile load

            for (int k = 0; k < TILE_SIZE; ++k) {
                kernelSum += tile_x[threadIdx.y][k] * tile_y[k][threadIdx.x];
            }
            __syncthreads();  // Synchronize for next tile calculation
        }
        d_z[idy * Width + idx] = kernelSum;
    }
}