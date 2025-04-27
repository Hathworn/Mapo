#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt_hack5_cp_rows(double * dst, double * shared_cols, double *shared_rows, int tile_y, int M, int N) {

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.x == 0)) {
        printf("copy rows begin!\n");
    }
#endif

    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = blockDim.x * blockIdx.x;
    int base_global_idx = N * base_global_row + base_global_col;
    int nextRow = base_global_row + 1;
    int t = threadIdx.x;

    // Store common calculations
    int global_col_within_bounds = base_global_col + t;

    // Check for valid column and row within bounds
    bool legalCurCol = global_col_within_bounds < N;
    bool legalNextRow = nextRow < M;

    int idx_base = (base_global_row / tile_y) * 2 * N + global_col_within_bounds;
    int idx_nextrow = idx_base + N;

    if (legalCurCol) {
        shared_rows[idx_base] = dst[base_global_idx + t];
    }
    if (legalNextRow && legalCurCol) {
        shared_rows[idx_nextrow] = dst[base_global_idx + N + t];
    }
    
    __syncthreads();

#ifdef CUDA_CUDA_DEBUG
    if (blockIdx.y == 0 && blockIdx.x == 2 && (t == 0 || t == 1)) {
        printf("addr:%d, val = %f\n", idx_nextrow, shared_rows[idx_nextrow]);
    }
#endif

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.x == 0)) {
        printf("copy rows finish!\n");
    }
#endif
}