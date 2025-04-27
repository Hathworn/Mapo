#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_CELL_PER_THREAD 1

__device__ void gpu_swap(void **a, void **b) {
    void *temp = *a;
    *a = *b;
    *b = temp;
}

__global__ void kernel_compute_gen_singleblock(uint8_t *matrix_src, uint8_t *matrix_dst, uint32_t dim_m1, uint32_t cols, uint32_t iterations, uint32_t cellPerThreads) {
    uint32_t start = threadIdx.x * cellPerThreads;
    uint32_t end = cellPerThreads + start;
    uint32_t x1, x0, x2, y1, y0, y2;
    uint8_t aliveCells;

    for (uint32_t iter = 0; iter < iterations; iter++) {
        // Loop unrolling to increase performance
        for (uint32_t cell = start; cell < end; cell++) {
            x1 = cell & cols-1; // % cols
            x0 = (x1 - 1) & cols-1; // % cols
            x2 = (x1 + 1) & cols-1; // % cols
            y1 = cell - x1;
            
            // Pre-calculate indices to avoid repeated computation
            y0 = (y1 - cols) & dim_m1; // % dim
            y2 = (y1 + cols) & dim_m1; // % dim

            // Optimize memory access by calculating aliveCells all at once
            aliveCells = matrix_src[x0 + y0] + matrix_src[x1 + y0] + matrix_src[x2 + y0] +
                         matrix_src[x0 + y1] + matrix_src[x2 + y1] +
                         matrix_src[x0 + y2] + matrix_src[x1 + y2] + matrix_src[x2 + y2];

            matrix_dst[y1 + x1] = (aliveCells == 3 || (aliveCells == 2 && matrix_src[y1 + x1])) ? 1 : 0;
        }

        gpu_swap((void**)&matrix_dst, (void**)&matrix_src);
        __syncthreads();
    }
}