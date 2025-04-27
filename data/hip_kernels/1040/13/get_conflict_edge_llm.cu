#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void get_conflict_edge(bool *dl_matrix, short *deleted_rows, int *row_group, const int conflict_node_id, const int search_depth, int *conflict_edge, const int vertex_num, const int total_dl_matrix_row_num, const int total_dl_matrix_col_num) {

    for (int i = threadIdx.x; i < total_dl_matrix_row_num; i += blockDim.x) {
        // Check for negative conflict node id
        if (deleted_rows[i] == -conflict_node_id) {
            atomicMax(conflict_edge, i);
        }
        // Check for matching search depth and conflict node id
        if (row_group[i] == search_depth + 1 && deleted_rows[i] == conflict_node_id) {
            atomicMax(conflict_edge + 1, i);
        }
    }
}

__global__ void get_conflict_edge(int *dl_matrix, int *deleted_rows, int *deleted_cols, int *row_group, const int conflict_node_id, const int search_depth, int *conflict_edge, const int vertex_num, const int total_dl_matrix_row_num, const int total_dl_matrix_col_num) {

    for (int i = threadIdx.x; i < total_dl_matrix_row_num; i += blockDim.x) {
        // Check for negative conflict node id
        if (deleted_rows[i] == -conflict_node_id) {
            atomicMax(conflict_edge, i);
        }
        // Check for matching search depth and conflict node id
        if (row_group[i] == search_depth + 1 && deleted_rows[i] == conflict_node_id) {
            atomicMax(conflict_edge + 1, i);
        }
    }
    __syncthreads();
}