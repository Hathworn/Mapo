#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt_hack5_cp_rows(double * dst, double * shared_cols, double *shared_rows,int tile_y,int M, int N){

#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(threadIdx.x==0)){
printf("copy rows begin!\n");
}
#endif

int base_global_row = tile_y * blockIdx.y;
int base_global_col = blockDim.x * blockIdx.x;
int base_global_idx = N * base_global_row + base_global_col;
int nextRow = base_global_row + 1;
bool legalNextRow = nextRow < M;
int t = threadIdx.x;
bool legalCurCol = base_global_col + t < N;
int shared_idx = (base_global_row / tile_y) * 2 * N + t + base_global_col;
int shared_idx_nextrow = shared_idx + N;

// Use of conditional stores to avoid warp divergence
if (legalCurCol) {
    shared_rows[shared_idx] = dst[base_global_idx + t];
    if (legalNextRow) {
        shared_rows[shared_idx_nextrow] = dst[base_global_idx + N + t];
    }
}
__syncthreads();

#ifdef CUDA_CUDA_DEBUG
if(blockIdx.y==0 && blockIdx.x==2 && (t==0 || t==1)){
printf("addr:%d, val = %f\n", shared_idx_nextrow, shared_rows[shared_idx_nextrow]);
}
#endif

#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(threadIdx.x==0)){
printf("copy rows finish!\n");
}
#endif
}