#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void check_existance_of_candidate_rows(short *deleted_rows, int *row_group, const int search_depth, int *token, int *selected_row_id, const int total_dl_matrix_row_num) {
    for (int i = threadIdx.x; i < total_dl_matrix_row_num; i += blockDim.x) {
        if (deleted_rows[i] == 0 && row_group[i] == search_depth) {
            *token = 1;
            atomicMin(selected_row_id, i);
        }
    }
}

__global__ void check_existance_of_candidate_rows(int *deleted_rows, int *row_group, const int search_depth, int *token, int *selected_row_id, const int total_dl_matrix_row_num) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensuring threads work on valid indices
    if (idx < total_dl_matrix_row_num) {
        if (deleted_rows[idx] == 0 && row_group[idx] == search_depth) {
            atomicExch(token, 1);
            atomicMin(selected_row_id, idx);
        }
    }
}