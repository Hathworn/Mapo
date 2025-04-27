#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}
#define ROTATE_DOWN(val,MAX) ((val-1==-1)?MAX-1:val-1)
#define ROTATE_UP(val,MAX) ((val+1)%MAX)
/**
* GPU Device kernel for the for 2D stencil
* First attempt during hackaton
* M = Rows, N = Cols INCLUDING HALOS
* In this version now we replace the size of the shared memory to be just 3 rows (actually 1+HALO*2) rows
*/

__global__ void gpu_stencil2D_4pt_hack5_cp_rows(double * dst, double * shared_cols, double *shared_rows,int tile_y,int M, int N){

#ifdef CUDA_DARTS_DEBUG
    if((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.x == 0)){
        printf("copy rows begin!\n");
    }
#endif
    
    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = blockDim.x * blockIdx.x;
    int base_global_idx = N * base_global_row + base_global_col;
    int nextRow = base_global_row + 1;
    bool legalNextRow = (nextRow < M);
    int t = threadIdx.x;
    bool legalCurCol = (base_global_col + t) < N;
    int idx = (base_global_row / tile_y) * 2 * N + t + base_global_col;
    int idx_nextrow = idx + N;
    
    // Use registers to reduce global memory access
    double val_curRow = (legalCurCol) ? dst[base_global_idx + t] : 0.0; 
    double val_nextRow = (legalNextRow && legalCurCol) ? dst[base_global_idx + N + t] : 0.0;

    if (legalCurCol) {
        shared_rows[idx] = val_curRow;
    }
    if (legalNextRow && legalCurCol) {
        shared_rows[idx_nextrow] = val_nextRow;
    }
    __syncthreads();

#ifdef CUDA_CUDA_DEBUG
    if(blockIdx.y == 0 && blockIdx.x == 2 && (t == 0 || t == 1)){
        printf("addr:%d, val = %f\n", idx_nextrow, shared_rows[idx_nextrow]);
    }
#endif

#ifdef CUDA_DARTS_DEBUG
    if((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.x == 0)){
        printf("copy rows finish!\n");
    }
#endif
}