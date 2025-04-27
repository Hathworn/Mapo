#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_partition(const float *a, const float *b, float *c, int n) {
    const int TILE_WIDTH = 8;
    __shared__ float na[TILE_WIDTH][TILE_WIDTH];
    __shared__ float nb[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x, tx = threadIdx.x;
    int by = blockIdx.y, ty = threadIdx.y;

    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    float sum = 0.0f;

    // Loop over tiles
    #pragma unroll // Unroll the loop for better performance
    for (int m = 0; m < n / TILE_WIDTH; m++) {
        // Load the tile into shared memory
        na[ty][tx] = a[row * n + m * TILE_WIDTH + tx];
        nb[ty][tx] = b[(m * TILE_WIDTH + ty) * n + col];
        __syncthreads(); // Ensure all threads have loaded the tile

        #pragma unroll // Unroll the loop for better performance
        for (int k = 0; k < TILE_WIDTH; k++) {
            sum += na[ty][k] * nb[k][tx];
        }
        __syncthreads(); // Synchronize threads before loading new tile
    }

    // Write the computed result to the output matrix
    c[row * n + col] = sum;
}