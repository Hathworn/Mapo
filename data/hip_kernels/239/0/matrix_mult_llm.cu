#include "hip/hip_runtime.h"
#include "includes.h"

#define N 256

__global__ void matrix_mult(float *dev_a, float* dev_b, float* dev_c, int Width) {
    // Use shared memory for tiling
    __shared__ float tile_a[16][16];
    __shared__ float tile_b[16][16];

    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;
    float Pvalue = 0;

    // Loop over the tiles of the input matrices
    for (int m = 0; m < Width/blockDim.x; ++m) {
        // Collaborative loading of tiles into shared memory
        tile_a[threadIdx.y][threadIdx.x] = dev_a[Row * Width + m * blockDim.x + threadIdx.x];
        tile_b[threadIdx.y][threadIdx.x] = dev_b[(m * blockDim.x + threadIdx.y) * Width + Col];

        // Ensure all threads have loaded the tiles
        __syncthreads();

        // Multiply the tiles together
        for (int k = 0; k < blockDim.x; ++k) {
            Pvalue += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x];
        }

        // Synchronize to make sure that the preceding computations are done before loading new tiles
        __syncthreads();
    }

    if ((Row < Width) && (Col < Width)) {
        dev_c[Row * Width + Col] = Pvalue;
    }
}