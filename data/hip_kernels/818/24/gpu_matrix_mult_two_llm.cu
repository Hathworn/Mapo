#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_matrix_mult_two(int *d_M, int *d_N, int *d_P, int m, int n, int k)
{
    // shared memory for tiling
    __shared__ int Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ int Nds[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;  
    int by = blockIdx.y;
    int tx = threadIdx.x; 
    int ty = threadIdx.y;

    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    int pval = 0;

    for (int ph = 0; ph < n / TILE_WIDTH; ph++) {
        // Optimized boundary checking
        if (row < k) {
            Mds[ty][tx] = (ph * TILE_WIDTH + tx < m) ? d_M[row * k + ph * TILE_WIDTH + tx] : 0;
        }
        if (col < m) {
            Nds[ty][tx] = (ph * TILE_WIDTH + ty < k) ? d_N[(ph * TILE_WIDTH + ty) * k + col] : 0;
        }

        __syncthreads();  // execution barrier

        // Unrolling loop for performance optimization
        #pragma unroll
        for (int j = 0; j < TILE_WIDTH; j++) {
            pval += Mds[ty][j] * Nds[j][tx];
        }

        __syncthreads();
    }

    if (row < k && col < m) {
        d_P[row * k + col] = pval;
    }
}