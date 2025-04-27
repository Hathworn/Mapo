#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void recover_deleted_rows(short *deleted_rows, const int search_depth, const int total_dl_matrix_row_num) {
    for (int i = threadIdx.x; i < total_dl_matrix_row_num; i += blockDim.x) {
        if (abs(deleted_rows[i]) >= search_depth) {
            deleted_rows[i] = 0;
        }
    }
}

__global__ void recover_deleted_rows(int *deleted_rows, const int search_depth, const int total_dl_matrix_row_num) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    for (int i = idx; i < total_dl_matrix_row_num; i += gridDim.x * blockDim.x) {
        if (abs(deleted_rows[i]) >= search_depth) {
            deleted_rows[i] = 0;
        }
    }
}