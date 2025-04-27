#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void recover_deleted_cols(short *deleted_cols, const int search_depth, const int total_dl_matrix_col_num) {
    // Optimize loop to avoid repeated calculation of thread index range
    for (int i = threadIdx.x; i < total_dl_matrix_col_num; i += blockDim.x) {
        if (deleted_cols[i] >= search_depth) {
            deleted_cols[i] = 0;
        }
    }
}

__global__ void recover_deleted_cols(int *deleted_cols, const int search_depth, const int total_dl_matrix_col_num) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Reduce thread divergence by processing valid indices only
    for (int i = idx; i < total_dl_matrix_col_num; i += gridDim.x * blockDim.x) {
        if (deleted_cols[i] >= search_depth) {
            deleted_cols[i] = 0;
        }
    }
}