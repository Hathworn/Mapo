#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt_hack5_cp_cols(double * dst, double * shared_cols, double * shared_rows, int tile_x, int tile_y, int M, int N) {

#ifdef CUDA_CUDA_DEBUG
    if((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.y == 0)) {
        printf("copy cols begin!\n");
    }
#endif

    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = tile_x * blockIdx.x;
    int base_global_idx = N * base_global_row + base_global_col;
    int nextCol = base_global_col + 1;
    bool legalNextCol = (nextCol < N);
    int t = threadIdx.y;

    // Compute both indices at once to reduce code repetition
    int idx = 2 * M * blockIdx.x + t + base_global_row;
    int row_offset = base_global_idx + t * N;
    
    // Combine conditions to minimize branching and memory accesses
    if(base_global_row + t < M) {
        shared_cols[idx] = dst[row_offset]; // Load current column
        if (legalNextCol) {
            shared_cols[idx + M] = dst[row_offset + 1]; // Load next column
        }
    }

    __syncthreads();

#ifdef CUDA_CUDA_DEBUG
    if(blockIdx.x == 1 && t < 5) {
        printf("addr: %d ,%f,\n", idx_nextCol, shared_cols[idx_nextCol]);
    }
#endif

#ifdef CUDA_CUDA_DEBUG
    if((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.y == 0)) {
        printf("copy cols finish!\n");
    }
#endif
}