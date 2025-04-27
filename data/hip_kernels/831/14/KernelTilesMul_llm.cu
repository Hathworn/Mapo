#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void KernelTilesMul(int *Mat1, int *Mat2, int *Mat3, int rowM1, int colM1, int colM2) {

    __shared__ int Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ int Nds[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    int Pvalue = 0;

    // Use a single outer loop for shared memory loading and processing
    for (int k = 0; k < (colM1 + TILE_WIDTH - 1) / TILE_WIDTH; ++k) {

        // Load data into shared memory with conditional
        if (k * TILE_WIDTH + tx < colM1 && row < rowM1) {
            Mds[ty][tx] = Mat1[row * colM1 + k * TILE_WIDTH + tx];
        } else {
            Mds[ty][tx] = 0;
        }

        if (k * TILE_WIDTH + ty < colM1 && col < colM2) {
            Nds[ty][tx] = Mat2[(k * TILE_WIDTH + ty) * colM2 + col];
        } else {
            Nds[ty][tx] = 0;
        }

        __syncthreads();

        // Unrolling the loop to improve performance
        #pragma unroll
        for (int n = 0; n < TILE_WIDTH; ++n) {
            Pvalue += Mds[ty][n] * Nds[n][tx];
        }

        __syncthreads();
    }

    // Write the result to matrix C if within boundary
    if (row < rowM1 && col < colM2) {
        Mat3[row * colM2 + col] = Pvalue;
    }
}