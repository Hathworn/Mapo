#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_CELL_PER_THREAD 1

__global__ void kernel_compute_gen_shared(uint8_t *matrix_src, uint8_t *matrix_dst, uint32_t dim_m1, uint32_t cols) {
    extern __shared__ uint8_t shared[];
    uint32_t cell = blockIdx.x * blockDim.x + threadIdx.x;

    uint32_t x1 = cell & (cols - 1);  // Optimized calculation for column index
    uint32_t x0 = (x1 - 1) & (cols - 1);
    uint32_t x2 = (x1 + 1) & (cols - 1);

    uint32_t y1 = cell - x1;
    uint32_t y0 = (y1 - cols) & dim_m1;  // Optimized calculation for row index
    uint32_t y2 = (y1 + cols) & dim_m1;

    // Load matrix data into shared memory with padding
    shared[threadIdx.x + 1] = matrix_src[x1 + y0];
    shared[threadIdx.x + 1 + blockDim.x + 2] = matrix_src[cell];
    shared[threadIdx.x + 1 + (blockDim.x + 2) * 2] = matrix_src[x1 + y2];

    if (threadIdx.x == 0) {
        // Load boundary cells for thread 0
        shared[0] = matrix_src[x0 + y0];
        shared[blockDim.x + 2] = matrix_src[x0 + y1];
        shared[(blockDim.x + 2) * 2] = matrix_src[x0 + y2];
    } else if (threadIdx.x == blockDim.x - 1) {
        // Load boundary cells for last thread
        shared[blockDim.x + 2 - 1] = matrix_src[x2 + y0];
        shared[(blockDim.x + 2) * 2 - 1] = matrix_src[x2 + y1];
        shared[(blockDim.x + 2) * 3 - 1] = matrix_src[x2 + y2];
    }

    __syncthreads();

    uint32_t scell = threadIdx.x + 1 + blockDim.x + 2;

    uint32_t sx1 = scell;  // Index calculations for shared memory
    uint32_t sx0 = (sx1 - 1);
    uint32_t sx2 = (sx1 + 1);

    uint32_t sy1 = scell - sx1;
    uint32_t sy0 = (sy1 - blockDim.x - 2);
    uint32_t sy2 = (sy1 + blockDim.x + 2);

    // Compute the number of alive cells in the neighborhood
    uint8_t aliveCells = shared[sx0 + sy0] + shared[sx1 + sy0] + shared[sx2 + sy0] +
                         shared[sx0 + sy1] + shared[sx2 + sy1] +
                         shared[sx0 + sy2] + shared[sx1 + sy2] + shared[sx2 + sy2];

    // Update the destination matrix based on cell rules
    matrix_dst[y1 + x1] = (aliveCells == 3 || (aliveCells == 2 && shared[scell])) ? 1 : 0;
}