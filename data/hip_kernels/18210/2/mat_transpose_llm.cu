#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mat_transpose(const float *a, float *b, int n, int m){
    const int TILE_WIDTH = 8;
    __shared__ float temp[TILE_WIDTH][TILE_WIDTH+1]; // Use padding to avoid bank conflicts

    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;

    int row = TILE_WIDTH * by + ty;
    int col = TILE_WIDTH * bx + tx;

    if (row < m && col < n) { // Boundary check to avoid accessing illegal memory
        temp[ty][tx] = a[row * n + col];
    }
    __syncthreads();

    row = TILE_WIDTH * bx + ty; // Transpose block offset
    col = TILE_WIDTH * by + tx;

    if (col < m && row < n) { // Boundary check for transposed indices
        b[col * n + row] = temp[tx][ty]; // Write transposed data
    }
}