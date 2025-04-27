#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulSh(float *Md, float *Nd, float *Pd, const int WIDTH)
{
    // Use shared memory to load tiles of Md and Nd
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate thread's global row and column index
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    float Pvalue = 0; // Accumulate product results

    // Loop over the Md and Nd tiles required to compute Pd element
    for (int m = 0; m < WIDTH / TILE_WIDTH; ++m)
    {
        // Load Md and Nd elements into shared memory
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        __syncthreads(); // Synchronize to ensure tiles are loaded

        // Multiply the tiles together
        for (int k = 0; k < TILE_WIDTH; ++k)
        {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }
        __syncthreads(); // Synchronize to ensure computation is complete before loading new tiles
    }

    // Write the computed value to Pd
    Pd[row * WIDTH + col] = Pvalue;
}