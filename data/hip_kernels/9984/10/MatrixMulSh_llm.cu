#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixMulSh( float *Md , float *Nd , float *Pd , const int WIDTH )
{
    // Use shared memory for sub-matrices from Md and Nd
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate global column and row for current thread
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Initialize the accumulator for the output element
    float Pvalue = 0;

    // Loop over all the tiles required to compute the block sub-matrix
    for (int m = 0; m < WIDTH / TILE_WIDTH; ++m)
    {
        // Load Md and Nd tiles into shared memory
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];

        // Synchronize to make sure the tiles are loaded
        __syncthreads();

        // Perform the multiplication for the tile
        for (int k = 0; k < TILE_WIDTH; ++k)
        {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }

        // Synchronize to make sure that the preceding computation is done before loading new tile into shared memory
        __syncthreads();
    }

    // Write the block sub-matrix to global memory
    Pd[row * WIDTH + col] = Pvalue;
}