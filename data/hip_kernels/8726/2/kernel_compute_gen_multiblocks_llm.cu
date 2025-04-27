#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_CELL_PER_THREAD 1

__global__ void kernel_compute_gen_multiblocks(uint8_t *matrix_src, uint8_t *matrix_dst, uint32_t dim_m1, uint32_t cols) {
    // Calculate global thread ID for 1D grid
    uint32_t cell = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute x and y coordinates in matrix from cell index
    uint32_t x1 = cell % cols;
    uint32_t x0 = (x1 + cols - 1) % cols; // Pre-computed modulo operation
    uint32_t x2 = (x1 + 1) % cols;

    uint32_t y1 = (cell - x1);
    uint32_t y0 = (y1 + dim_m1 - cols) % dim_m1; // Pre-computed modulo operation
    uint32_t y2 = (y1 + cols) % dim_m1;

    // Accumulate alive neighbor cells
    uint8_t aliveCells = matrix_src[x0 + y0] + matrix_src[x1 + y0] + matrix_src[x2 + y0] +
                         matrix_src[x0 + y1] + matrix_src[x2 + y1] + 
                         matrix_src[x0 + y2] + matrix_src[x1 + y2] + matrix_src[x2 + y2];

    // Update matrix based on the rules
    matrix_dst[y1 + x1] = (aliveCells == 3 || (aliveCells == 2 && matrix_src[y1 + x1])) ? 1 : 0;
}