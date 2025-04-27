#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt_hack5_cp_rows(double *dst, double *shared_cols, double *shared_rows, int tile_y, int M, int N) {

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.x == 0)) {
        printf("copy rows begin!\n");
    }
#endif

    int base_global_row = (tile_y * blockIdx.y);
    int base_global_col = blockDim.x * blockIdx.x;
    int base_global_idx = N * base_global_row + base_global_col;
    int t = threadIdx.x;

    // Calculate indices for current and next row, check boundaries
    int idx = (base_global_row / tile_y) * 2 * N + t + base_global_col;
    int idx_nextrow = idx + N;
    int global_idx_t = base_global_idx + t;
    int global_idx_nextrow_t = base_global_idx + N + t;

    bool legalCurCol = (base_global_col + t) < N;
    bool legalNextRow = (base_global_row + 1) < M;

    // Coalesced memory access
    if (legalCurCol) {
        shared_rows[idx] = dst[global_idx_t];
    }
    if (legalNextRow && legalCurCol) {
        shared_rows[idx_nextrow] = dst[global_idx_nextrow_t];
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