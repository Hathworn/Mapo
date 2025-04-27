#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelMultMatTiled(float *d_M, float *d_N, float *d_P, int m, int n, int y) {

    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;
    float Pvalue = 0;

    // Loop unrolling for increased efficiency
    for(int i = 0; i < n / TILE_WIDTH; i++) {
        // Load tiles into shared memory with bounds check
        Mds[ty][tx] = (i * TILE_WIDTH + tx < n && row < m) ? d_M[row * n + i * TILE_WIDTH + tx] : 0.0f;
        Nds[ty][tx] = (i * TILE_WIDTH + ty < n && col < y) ? d_N[(i * TILE_WIDTH + ty) * y + col] : 0.0f;
        __syncthreads();

        // Unroll inner loop for better performance
        #pragma unroll
        for(int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += Mds[ty][k] * Nds[k][tx];
        }
        __syncthreads();
    }

    // Store the result in d_P with bounds check
    if(row < m && col < y) {
        d_P[row * y + col] = Pvalue;
    }
}