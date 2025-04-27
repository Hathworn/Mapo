#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulSh( float *Md , float *Nd , float *Pd , const int WIDTH )
{
    // Utilizing shared memory to load matrix tiles
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Initialize the element in the result matrix to zero
    float Pvalue = 0.0f;

    for (int m = 0; m < WIDTH / TILE_WIDTH; m++) // m indicates number of phases
    {
        // Load tiles into shared memory
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        __syncthreads(); // Ensure all threads have loaded their data

        // Compute the partial result for this tile
        for (int k = 0; k < TILE_WIDTH; k++)
        {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }
        __syncthreads(); // Synchronize before loading new tiles
    }

    // Write the computed value to the output matrix
    Pd[row * WIDTH + col] = Pvalue;
}