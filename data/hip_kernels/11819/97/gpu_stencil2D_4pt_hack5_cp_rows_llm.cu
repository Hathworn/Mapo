#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt_hack5_cp_rows(double * dst, double * shared_cols, double *shared_rows, int tile_y, int M, int N){
    
    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = blockDim.x * blockIdx.x;
    int base_global_idx = N * base_global_row + base_global_col;
    int nextRow = base_global_row + 1;
    int t = threadIdx.x;
    bool legalCurCol = (base_global_col + t) < N;
    
    // Calculate index for copying current and next row
    int idx = (base_global_row/tile_y) * 2 * N + t + base_global_col;
    int idx_nextrow = idx + N;
    
    // Copy current row elements if within bounds
    if (legalCurCol) {
        shared_rows[idx] = dst[base_global_idx + t];
    }
    
    // Copy next row elements if within legal range
    if (nextRow < M && legalCurCol) {
        shared_rows[idx_nextrow] = dst[base_global_idx + N + t];
    }

    __syncthreads();
}