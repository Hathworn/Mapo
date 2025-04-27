#include "hip/hip_runtime.h"
#include "includes.h"

const int CHUNK_SIZE = 32;
const int CHUNK_ROWS = 8;

__global__ void matrix_t(int* data, int* out, int* rows, int* cols) {
    __shared__ int chunk[CHUNK_SIZE][CHUNK_SIZE + 1]; // Avoid bank conflicts

    int x = blockIdx.x * CHUNK_SIZE + threadIdx.x;
    int y = blockIdx.y * CHUNK_SIZE + threadIdx.y;

    if (x < *cols && y < *rows) {
        // Efficiently load chunk of the matrix into shared memory
        for (int i = 0; i < CHUNK_SIZE; i += CHUNK_ROWS) {
            if (y + i < *rows) {
                chunk[threadIdx.y + i][threadIdx.x] = data[(y + i) * *cols + x];
            }
        }
    }
    __syncthreads();

    x = blockIdx.y * CHUNK_SIZE + threadIdx.x;
    y = blockIdx.x * CHUNK_SIZE + threadIdx.y;

    if (x < *rows && y < *cols) {
        // Write transposed chunk to the output matrix
        for (int i = 0; i < CHUNK_SIZE; i += CHUNK_ROWS) {
            if (y + i < *cols) {
                out[(y + i) * *rows + x] = chunk[threadIdx.x][threadIdx.y + i];
            }
        }
    }
}