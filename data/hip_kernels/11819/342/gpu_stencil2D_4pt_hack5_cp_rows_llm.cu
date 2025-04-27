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
    int idx = (base_global_row / tile_y) * 2 * N + t + base_global_col;

    // Optimized condition check using memory coalescing
    if ((base_global_col + t) < N) {
        shared_rows[idx] = dst[base_global_idx + t];
        if (nextRow < M) {
            shared_rows[idx + N] = dst[base_global_idx + N + t];
        }
    }

    __syncthreads();

#ifdef CUDA_CUDA_DEBUG
    if (blockIdx.y == 0 && blockIdx.x == 2 && (t == 0 || t == 1)) {
        printf("addr:%d, val = %f\n", idx + N, shared_rows[idx + N]);
    }
#endif

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.x == 0)) {
        printf("copy rows finish!\n");
    }
#endif
}