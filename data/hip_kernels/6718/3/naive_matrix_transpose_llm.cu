#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void optimized_matrix_transpose(float *input, int axis_0, int axis_1, float *output)
{
    // Use shared memory with padding to avoid bank conflicts
    __shared__ float tile[TILE_DIM][TILE_DIM + 1];

    int xIndex = blockIdx.x * TILE_DIM + threadIdx.x;
    int yIndex = blockIdx.y * TILE_DIM + threadIdx.y;
    
    // Load data into shared memory with coalesced access
    if (xIndex < axis_0) {
        for (int i = 0; i < TILE_DIM && (yIndex + i) < axis_1; i += BLOCK_HEIGHT) {
            tile[threadIdx.y + i][threadIdx.x] = input[(yIndex + i) * axis_0 + xIndex];
        }
    }

    __syncthreads();

    xIndex = blockIdx.y * TILE_DIM + threadIdx.x; // Transpose block offset
    yIndex = blockIdx.x * TILE_DIM + threadIdx.y;

    // Write transposed data from shared memory to global memory with coalesced access
    if (yIndex < axis_0) {
        for (int i = 0; i < TILE_DIM && (xIndex + i) < axis_1; i += BLOCK_HEIGHT) {
            output[(xIndex + i) * axis_0 + yIndex] = tile[threadIdx.x][threadIdx.y + i];
        }
    }
}