#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_v4(float* a, float* b, int n) {
    // Calculate transposed block index
    int blockIdx_x = blockIdx.y;
    int blockIdx_y = (blockIdx.x + blockIdx.y) % gridDim.x;

    // Thread indices within the block
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Determine global indices
    int bx = blockIdx_x;
    int by = blockIdx_y;
    int i = bx * BX + tx;
    int j = by * BY + ty;

    // Shared memory tile with padding to avoid bank conflict
    __shared__ float tile[BY][BX + 1];

    // Boundary check
    if (i < n && j < n) {
        // Load data into shared memory
        tile[ty][tx] = a[j * n + i];
    }

    __syncthreads();

    // Transpose indices
    i = by * BY + tx;
    j = bx * BX + ty;

    // Check boundaries again before writing to global memory
    if (i < n && j < n) {
        b[j * n + i] = tile[tx][ty];
    }
}