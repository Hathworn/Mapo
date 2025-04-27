#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tile_MatrixMul(int* a, int* b, int* c, int n, int tile_size) {
    // Allocate shared memory statically
    __shared__ int A[Shared_Mem_Size];
    __shared__ int B[Shared_Mem_Size];

    // Calculate thread indices
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // Calculate global row and column positions for this thread
    int row = by * tile_size + ty;
    int col = bx * tile_size + tx;

    // Intermediate sum for element being written
    int temp_val = 0;

    // Sweep tiles over the entire matrix
    for (int i = 0; i < (n + tile_size - 1) / tile_size; i++) {
        // Load one element into shared memory
        if (row < n && (i * tile_size + tx) < n) {
            A[(ty * tile_size) + tx] = a[row * n + (i * tile_size + tx)];
        } else {
            A[(ty * tile_size) + tx] = 0;
        }

        if (col < n && (i * tile_size + ty) < n) {
            B[(ty * tile_size) + tx] = b[(i * tile_size * n + ty * n) + col];
        } else {
            B[(ty * tile_size) + tx] = 0;
        }

        // Ensure all threads have loaded their data
        __syncthreads();

        // Calculate all temp values for this tile
        for (int j = 0; j < tile_size; j++) {
            temp_val += A[(ty * tile_size) + j] * B[(j * tile_size) + tx];
        }

        // Ensure all threads complete the computation before overwriting shared memory
        __syncthreads();
    }

    // Writeback to global memory
    if (row < n && col < n) {
        c[(row * n) + col] = temp_val;
    }
}