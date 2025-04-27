#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt_hack5_cp_cols(double * dst, double * shared_cols, double *shared_rows,int tile_x,int tile_y, int M, int N){

#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(threadIdx.y==0)){
printf("copy cols begin!\n");
}
#endif

int base_global_row = tile_y  * blockIdx.y;
int base_global_col = tile_x  * blockIdx.x;
int base_global_idx = N*base_global_row + base_global_col ;
bool legalCurRow = (base_global_row + threadIdx.y)<M;
bool legalNextCol = (base_global_col + 1)<N;

int idx = 2*M*blockIdx.x + threadIdx.y + base_global_row;

// Optimize index calculation and memory access
if(legalCurRow) {
    shared_cols[idx] = dst[base_global_idx + threadIdx.y*N];
    if (legalNextCol) {
        shared_cols[idx + M] = dst[base_global_idx + threadIdx.y*N + 1];
    }
}
__syncthreads();

#ifdef CUDA_CUDA_DEBUG
if(blockIdx.x==1 && threadIdx.y<5){
printf("addr: %d, %f,\n", idx + M, shared_cols[idx + M]);
}
#endif

#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(threadIdx.y==0)){
printf("copy cols finish!\n");
}
#endif
}