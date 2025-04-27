#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_CELL_PER_THREAD 1

__device__ void gpu_swap(void **a, void **b) {
    void *temp = *a;
    *a = *b;
    *b = temp;
}

__global__ void kernel_compute_gen_singleblock_1(uint8_t *matrix_src, uint8_t *matrix_dst, uint32_t dim_m1, uint32_t cols, uint32_t iterations) {
    // Compute cell index considering block size
    uint32_t cell = blockIdx.x * blockDim.x + threadIdx.x;

    // Precompute column and row indices
    uint32_t x1 = cell & (cols - 1);
    uint32_t x0 = (x1 - 1) & (cols - 1);
    uint32_t x2 = (x1 + 1) & (cols - 1);

    uint32_t y1 = cell - x1;
    uint32_t y0 = (y1 - cols) & dim_m1;
    uint32_t y2 = (y1 + cols) & dim_m1;

    for (uint32_t iter = 0; iter < iterations; iter++) {
        // Calculate alive cells using shared memory
        uint8_t aliveCells = matrix_src[x0 + y0] + matrix_src[x1 + y0] + matrix_src[x2 + y0] +
                             matrix_src[x0 + y1] + matrix_src[x2 + y1] +
                             matrix_src[x0 + y2] + matrix_src[x1 + y2] + matrix_src[x2 + y2];

        // Update the matrix
        matrix_dst[y1 + x1] = (aliveCells == 3 || (aliveCells == 2 && matrix_src[y1 + x1])) ? 1 : 0;
        
        // Only swap pointers if needed outside the loop
        if(threadIdx.x == 0) {
            gpu_swap((void**)&matrix_dst, (void**)&matrix_src);
        }
        __syncthreads();
    }
}