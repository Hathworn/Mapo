#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void remove_cols(short *deleted_cols, int *col_group, const int conflict_col_id, const int total_dl_matrix_col_num) {
    for (int i = threadIdx.x; i < total_dl_matrix_col_num; i = i + blockDim.x) {
        if (col_group[i] == col_group[conflict_col_id]) {
            deleted_cols[i] = -1;
        }
    }
}

__global__ void remove_cols(short *deleted_cols, int *col_group, const int conflict_col_id, const int total_dl_matrix_col_num) {
    // Utilizing shared memory to minimize global memory access
    extern __shared__ int col_group_shared[];
    
    int tid = threadIdx.x;
    col_group_shared[tid] = col_group[tid];
    __syncthreads();

    for (int i = tid; i < total_dl_matrix_col_num; i += blockDim.x) {
        if (col_group_shared[i] == col_group_shared[conflict_col_id]) {
            deleted_cols[i] = -1;
        }
    }
}