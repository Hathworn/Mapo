#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mat_transpose_regular_kernel(int *mat, int *res) {
    // Define constants
    const int tile_dim = 32;
    const int blocks_per_row = 32;
    const int rows_per_block_iter = 64;

    // Calculate tile row and column
    int tile_row = blockIdx.x / blocks_per_row;
    int tile_col = blockIdx.x % blocks_per_row;

    // Calculate intra-tile row and column
    int intile_row = threadIdx.x / tile_dim;
    int intile_col = threadIdx.x % tile_dim;

    // Calculate global row and column
    int my_row_base = tile_row * tile_dim + intile_row;
    int my_col_base = tile_col * tile_dim + intile_col;

    // Prefetch data using registers to reduce global memory accesses
    int shared_mat[tile_dim]; // Store tile in shared memory

    // Loop over block iterations - unroll the loop for better performance
    #pragma unroll
    for (int block_iter = 0; block_iter < 16; block_iter++) {
        int my_row = my_row_base + (rows_per_block_iter * block_iter);
        int my_col = my_col_base;
        // Load data into shared memory
        shared_mat[intile_row] = mat[(my_row * 1024) + my_col];

        // Synchronize threads
        __syncthreads();

        // Write the transposed data to the output
        res[(my_col * 1024) + my_row] = shared_mat[intile_row];

        // Synchronize threads
        __syncthreads();
    }
}