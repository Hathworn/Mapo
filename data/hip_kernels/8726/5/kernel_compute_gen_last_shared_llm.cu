#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_CELL_PER_THREAD 1

__global__ void kernel_compute_gen_last_shared(uint8_t *matrix_src, uint8_t *matrix_dst, uint32_t rows, uint32_t cols) {
    __shared__ int shared[3][128 + 2];

    int ix = ((blockDim.x - 2) * blockIdx.x + threadIdx.x) & (cols - 1);
    int iy = (blockIdx.y * blockDim.y + threadIdx.y) & (rows - 1); // Changed to account for block size
    int id = iy * cols + ix;

    int i = threadIdx.y;
    int j = threadIdx.x;

    uint8_t mine = matrix_src[id]; // Keep cell in register
    shared[i][j] = mine;

    __syncthreads();

    if (i == 1 && j > 0 && j < blockDim.x - 1) {
        // Unrolled neighbor computation for fewer memory accesses
        uint8_t aliveCells = shared[i + 1][j] + 
                             shared[i - 1][j] +
                             shared[i][j + 1] +
                             shared[i][j - 1] +
                             shared[i + 1][j + 1] +
                             shared[i - 1][j - 1] +
                             shared[i - 1][j + 1] + 
                             shared[i + 1][j - 1];

        // Direct computation and write back result
        matrix_dst[id] = (aliveCells == 3 || (aliveCells == 2 && mine)) ? 1 : 0;
    }
}