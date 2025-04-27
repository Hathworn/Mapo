```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil37_hack1_cp_cols(double * dst, double * shared_rows, double *shared_cols,double *shared_slices,int n_rows, int n_cols,int n_slices,int tile_x,int tile_y, int tile_z){

#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(blockIdx.z==0)&&(threadIdx.y==0)&& threadIdx.x==0 && threadIdx.z==0){
printf("copy cols begin\n");
printf("gridDim.x=%d,gridDim.y=%d,gridDim.z=%d\n",gridDim.x,gridDim.y,gridDim.z);
printf("blockDim.x=%d,blockDim.y=%d,blockDim.z=%d\n",blockDim.x,blockDim.y,blockDim.z);
printf("tile_x=%d,tile_y=%d,tile_z=%d\n",tile_x,tile_y,tile_z);
}
#endif

// Precompute values that stay constant
int area_dst = n_rows * n_cols;
int area_shared = gridDim.x * n_rows * 2;
int base_global_slice = tile_z * blockIdx.z;
int base_global_row = blockDim.y * blockIdx.y;
int base_global_col = tile_x * blockIdx.x;
int base_global_idx = base_global_slice * area_dst + base_global_row * n_cols + base_global_col;
int nextCol = base_global_col + 1;

bool legalNextCol = (nextCol < n_cols);
int ty = threadIdx.y;
bool legalCurRow = (base_global_row + ty) < n_rows;

// Loop unrolling for improved performance
for(int tz = 0; tz < tile_z; ++tz) {
    bool legalCurSlice = (base_global_slice + tz) < n_slices;
    int idx_dst = base_global_idx + tz*area_dst + ty*n_cols;
    int idx = (base_global_slice + tz) * area_shared + blockIdx.x * 2 * n_rows + blockIdx.y * blockDim.y + ty;

    // Conditional moves to reduce branching
    double src_val = (legalCurRow && legalCurSlice) ? dst[idx_dst] : 0.0;
    shared_cols[idx] = src_val;

    if(legalNextCol) {
        double src_val_next = (legalCurRow && legalCurSlice) ? dst[idx_dst + 1] : 0.0;
        shared_cols[idx + n_rows] = src_val_next;
    }

    __syncthreads();
}

__syncthreads();

#ifdef CUDA_CUDA_DEBUG
if(blockIdx.z ==0 && blockIdx.y==0 && blockIdx.x==0 && (threadIdx.x==0)){
//		printf("shared_cols: addr:%d, val = %f\n", threadIdx.y,shared_cols[threadIdx.y]);
}
#endif

#ifdef CUDA_DARTS_DEBUG
if((blockIdx.x==0)&&(blockIdx.y==0)&&(blockIdx.z==0)&&(threadIdx.y==0 && threadIdx.x==0 && threadIdx.z==0)){
printf("copy cols end!\n");
}
#endif
}
```
