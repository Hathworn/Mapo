#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt_hack5_cp_cols(double *dst, double *shared_cols, double *shared_rows, int tile_x, int tile_y, int M, int N) {

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.y == 0)) {
        printf("copy cols begin!\n");
    }
#endif

    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = tile_x * blockIdx.x;
    int base_global_idx = N * base_global_row + base_global_col;
    int nextCol = base_global_col + 1;
    bool legalNextCol = (nextCol < N);
    int t = threadIdx.y;
    int idx = 2 * M * blockIdx.x + t + base_global_row;
    int idx_nextCol = idx + M;
    bool legalCurRow = (base_global_row + t) < M;

    // Use a single shared memory fetch for better efficiency
    if (legalCurRow) {
        double value = dst[base_global_idx + t * N];
        shared_cols[idx] = value;
        if (legalNextCol) {
            shared_cols[idx_nextCol] = dst[base_global_idx + t * N + 1]; 
        }
    }
    __syncthreads();

#ifdef CUDA_CUDA_DEBUG
    if (blockIdx.x == 1 && t < 5) {
        printf("addr: %d, %f,\n", idx_nextCol, shared_cols[idx_nextCol]);
    }
#endif

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.y == 0)) {
        printf("copy cols finish!\n");
    }
#endif
}