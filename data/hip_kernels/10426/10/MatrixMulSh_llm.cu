#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulSh(float *Md, float *Nd, float *Pd, const int WIDTH)
{
    // Allocate shared memory for tiles
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate thread indices
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    float Pvalue = 0; // Accumulator for the compute

    for (int m = 0; m < WIDTH / TILE_WIDTH; m++) // Loop over phases
    {
        // Load tiles into shared memory
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        
        __syncthreads(); // Synchronize to ensure all tiles are loaded

        // Accumulate partial results
        for (int k = 0; k < TILE_WIDTH; k++)
        {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }

        __syncthreads(); // Synchronize before loading new tile
    }

    // Write the result to the output matrix
    Pd[row * WIDTH + col] = Pvalue;
}