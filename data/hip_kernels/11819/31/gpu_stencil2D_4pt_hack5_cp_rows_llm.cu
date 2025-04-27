```c++
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt_hack5_cp_rows(double * dst, double * shared_cols, double *shared_rows,int tile_y,int M, int N){

// Debug print start of copy
#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(threadIdx.x==0)){
    printf("copy rows begin!\n");
}
#endif

// Calculate base indices and conditions
int base_global_row = tile_y * blockIdx.y;
int base_global_col = blockDim.x * blockIdx.x;
int base_global_idx = N * base_global_row + base_global_col;
int t = threadIdx.x;
bool legalCurCol = (base_global_col + t) < N;
int idx = (base_global_row/tile_y) * 2 * N + base_global_col + t;
int idx_nextrow = idx + N;

// Copy current row
if (legalCurCol) {
    shared_rows[idx] = dst[base_global_idx + t];
}

// Copy next row if within bounds
int nextRow = base_global_row + 1;
if (nextRow < M && legalCurCol) {
    shared_rows[idx_nextrow] = dst[base_global_idx + N + t];
}

__syncthreads();

// Debug print specific conditions
#ifdef CUDA_CUDA_DEBUG
if (blockIdx.y == 0 && blockIdx.x == 2 && (t == 0 || t == 1)) {
    printf("addr:%d, val = %f\n", idx_nextrow, shared_rows[idx_nextrow]);
}
#endif

// Debug print end of copy
#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(threadIdx.x==0)){
    printf("copy rows finish!\n");
}
#endif
}