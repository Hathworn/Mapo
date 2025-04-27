#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_transpose_coalesced_kernel(int *mat, int *res) {
    // Define constants
    const int tile_dim = 32;
    const int blocks_per_row = 32;
    const int rows_per_block_iter = 64;

    // Shared memory for tiles
    __shared__ int smem[tile_dim * tile_dim];

    // Compute tile position
    int tile_row = blockIdx.x / blocks_per_row;
    int tile_col = blockIdx.x % blocks_per_row;

    // Compute thread position within tile
    int intile_row = threadIdx.x / tile_dim;
    int intile_col = threadIdx.x % tile_dim;

    // Loop over multiple block iterations
    for (int block_iter = 0; block_iter < 16; block_iter++) {
        // Compute global read position
        int read_row = tile_row * tile_dim + intile_row + block_iter * rows_per_block_iter;
        int read_col = tile_col * tile_dim + intile_col;

        // Load tile into shared memory
        smem[intile_row * tile_dim + intile_col] = mat[read_row * 1024 + read_col];
        __syncthreads();

        // Compute global write position
        int write_row = tile_col * tile_dim + intile_row;
        int write_col = tile_row * tile_dim + intile_col + block_iter * rows_per_block_iter;

        // Write transposed tile to output
        res[write_row * 1024 + write_col] = smem[intile_col * tile_dim + intile_row];
    }
}