#include "hip/hip_runtime.h"
#include "includes.h"

// Define TILE_WIDTH for the shared memory tiles
#define TILE_WIDTH 16

__global__ void MatrixMulSh( float *Md, float *Nd, float *Pd, const int WIDTH )
{
    // Shared memory tiles for sub-matrices
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate thread indices for matrix
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Initialize element accumulator
    float Pvalue = 0.0f;

    for (int m = 0; m < WIDTH / TILE_WIDTH; m++)
    {
        // Load Md and Nd matrices into shared memory
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        __syncthreads(); // Synchronize threads

        // Compute sub-matrix multiplication
        for (int k = 0; k < TILE_WIDTH; k++)
        {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }
        __syncthreads(); // Synchronize threads
    }

    // Write result to Pd matrix
    Pd[row * WIDTH + col] = Pvalue;
}