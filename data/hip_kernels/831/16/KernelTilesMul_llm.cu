#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void KernelTilesMul(float *Mat1, float *Mat2, float *Mat3, int rowM1, int colM1, int colM2) {
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    float Pvalue = 0.0;

    for (int k = 0; k < (colM1 + TILE_WIDTH - 1) / TILE_WIDTH; ++k) {
        // Efficiently load tiles into shared memory
        if (k * TILE_WIDTH + tx < colM1 && row < rowM1) {
            Mds[ty][tx] = Mat1[row * colM1 + k * TILE_WIDTH + tx];
        } else {
            Mds[ty][tx] = 0.0f; // Use 0.0f to denote float constant
        }

        if (k * TILE_WIDTH + ty < colM1 && col < colM2) {
            Nds[ty][tx] = Mat2[(k * TILE_WIDTH + ty) * colM2 + col];
        } else {
            Nds[ty][tx] = 0.0f; // Use 0.0f to denote float constant
        }

        __syncthreads();

        // Compute partial product for the current tile
        for (int n = 0; n < TILE_WIDTH; ++n) {
            Pvalue += Mds[ty][n] * Nds[n][tx];
        }

        __syncthreads();
    }

    // Write the block/sub-matrix result to the global memory
    if (row < rowM1 && col < colM2) {
        Mat3[row * colM2 + col] = Pvalue;
    }
}