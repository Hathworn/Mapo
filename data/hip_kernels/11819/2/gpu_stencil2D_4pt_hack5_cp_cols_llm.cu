#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}
#define ROTATE_DOWN(val,MAX) ((val-1==-1)?MAX-1:val-1)
#define ROTATE_UP(val,MAX) ((val+1)%MAX)

__global__ void gpu_stencil2D_4pt_hack5_cp_cols(double * dst, double * shared_cols, double *shared_rows, int tile_x, int tile_y, int M, int N) {

#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(threadIdx.y==0)){
printf("copy cols begin!\n");
}
#endif

int base_global_row = tile_y * blockIdx.y;
int base_global_col = tile_x * blockIdx.x;
int base_global_idx = N * base_global_row + base_global_col;
int t = threadIdx.y;
int idx = 2 * M * blockIdx.x + t + base_global_row;
bool legalCurRow = (base_global_row + t) < M;

// Load column data to shared memory
if (legalCurRow) {
    shared_cols[idx] = dst[base_global_idx + t * N];
    if ((base_global_col + 1) < N) { // Combine condition checks into a single if
        shared_cols[idx + M] = dst[base_global_idx + t * N + 1];
    }
}

__syncthreads();

#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(threadIdx.y==0)){
printf("copy cols finish!\n");
}
#endif
}