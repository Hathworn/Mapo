#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt_hack5_cp_cols(double * dst, double * shared_cols, double * shared_rows, int tile_x, int tile_y, int M, int N) {

#ifdef CUDA_DARTS_DEBUG
    if((blockIdx.x==0) && (blockIdx.y==0) && (threadIdx.y==0)){
        printf("copy cols begin!\n");
    }
#endif

    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = tile_x * blockIdx.x;
    int base_global_idx = N * base_global_row + base_global_col;
    int t = threadIdx.y;
    int global_row = base_global_row + t;
    int idx = 2 * M * blockIdx.x + t + base_global_row;

    // Check boundary conditions only once
    if(global_row < M) {
        shared_cols[idx] = dst[base_global_idx + t * N]; // Load current column
        int nextColIdx = idx + M; // M is the stride for the next column

        if((base_global_col + 1) < N) // Check if next column is within bounds
            shared_cols[nextColIdx] = dst[base_global_idx + t * N + 1]; // Load next column
    }
    
    __syncthreads();

#ifdef CUDA_CUDA_DEBUG
    if(blockIdx.x == 1 && t < 5){
        printf("addr: %d ,%f,\n", idx + M, shared_cols[idx + M]);
    }
#endif

#ifdef CUDA_DARTS_DEBUG
    if((blockIdx.x==0) && (blockIdx.y==0) && (threadIdx.y==0)){
        printf("copy cols finish!\n");
    }
#endif
}