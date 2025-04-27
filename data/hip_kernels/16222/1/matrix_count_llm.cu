#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_count(int* data, int* count, int* rows, int* cols) {
    __shared__ int chunk[CHUNK_SIZE][CHUNK_SIZE];

    int x = blockIdx.x * CHUNK_SIZE + threadIdx.x;
    int y = blockIdx.y * CHUNK_SIZE + threadIdx.y;
    int limit = CHUNK_SIZE / CHUNK_ROWS * CHUNK_ROWS;

    // Load data into shared memory efficiently
    for (int i = 0; i < limit; i += CHUNK_ROWS) {
        if ((y + i) < *rows && x < *cols) {
            chunk[threadIdx.y + i][threadIdx.x] = data[(y + i) * (*cols) + x];
        } else {
            chunk[threadIdx.y + i][threadIdx.x] = 0; // Handle out-of-bounds data
        }
    }
    __syncthreads();

    x = blockIdx.y * CHUNK_SIZE + threadIdx.x;
    y = blockIdx.x * CHUNK_SIZE + threadIdx.y;

    // Process data in shared memory
    for (int i = 0; i < CHUNK_SIZE; i += CHUNK_ROWS) {
        if (x < *cols && (y + i) < *rows) {
            if (chunk[threadIdx.x][threadIdx.y + i] == 1) {
                atomicAdd(count, 1); // Use atomic operation to update count
            }
        }
    }
}