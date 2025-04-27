#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_v2(float* a, float* b, int n) {
    // Calculate the column and row index for the tile
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;
    
    int col = bx * blockDim.x + tx;
    int row = by * blockDim.y + ty;

    // Declare shared memory tile
    __shared__ float tile[BY][BX];

    // Check boundary
    if (col < n && row < n) {
        // Load into shared memory
        tile[ty][tx] = a[row * n + col];
    }
    __syncthreads();

    // Transpose the block and calculate transposed index
    col = by * blockDim.y + tx;
    row = bx * blockDim.x + ty;

    // Write transposed result to output matrix
    if (col < n && row < n) {
        b[row * n + col] = tile[tx][ty];
    }
}