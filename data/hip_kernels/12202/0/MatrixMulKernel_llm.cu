#include "hip/hip_runtime.h"
#include "includes.h"

// The matrix dimensions
static const int M = 3;
static const int N = 5;
static const int K = 4;
static const int TILE_WIDTH = 2;

// Kernel function for matrix multiplication
__global__ void MatrixMulKernel(int ARows, int ACols, int BRows, int BCols, int CRows, int CCols, unsigned int* A_d, unsigned int* B_d, unsigned int* C_d) {
    // Compute row and column indices
    int Row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int Col = blockIdx.x * TILE_WIDTH + threadIdx.x;

    // Define shared memory for tiles
    __shared__ int As[TILE_WIDTH][TILE_WIDTH];
    __shared__ int Bs[TILE_WIDTH][TILE_WIDTH];

    // Accumulate result for CValue
    int CValue = 0;
    
    for (int k = 0; k < (ACols + TILE_WIDTH - 1)/TILE_WIDTH; ++k) {
        // Load tiles into shared memory
        if (k * TILE_WIDTH + threadIdx.x < ACols && Row < ARows) {
            As[threadIdx.y][threadIdx.x] = A_d[Row * ACols + k * TILE_WIDTH + threadIdx.x];
        } else {
            As[threadIdx.y][threadIdx.x] = 0;
        }

        if (k * TILE_WIDTH + threadIdx.y < BRows && Col < BCols) {
            Bs[threadIdx.y][threadIdx.x] = B_d[(k * TILE_WIDTH + threadIdx.y) * BCols + Col];
        } else {
            Bs[threadIdx.y][threadIdx.x] = 0;
        }

        __syncthreads();

        // Perform multiplication on the tile
        for (int n = 0; n < TILE_WIDTH; ++n) {
            CValue += As[threadIdx.y][n] * Bs[n][threadIdx.x];
        }

        __syncthreads();
    }

    // Write the result to the output matrix
    if (Row < CRows && Col < CCols) {
        C_d[Row * CCols + Col] = CValue;
    }
}