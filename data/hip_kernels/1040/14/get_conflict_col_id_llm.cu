#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void get_conflict_col_id(bool *dl_matrix, short *deleted_cols, int *conflict_col_id, int *conflict_edge, int total_dl_matrix_col_num, int vertex_num) {
    // Pointer to edge_a and edge_b in dl_matrix to reduce redundant calculations
    bool *edge_a_dlmatrix = dl_matrix + conflict_edge[0] * total_dl_matrix_col_num;
    bool *edge_b_dlmatrix = dl_matrix + conflict_edge[1] * total_dl_matrix_col_num;

    // Loop with step size as blockDim.x for conflict column checking
    for (int j = threadIdx.x; j < total_dl_matrix_col_num; j += blockDim.x) {
        // Check condition and use atomicMax for recording highest index
        if (edge_a_dlmatrix[j] == edge_b_dlmatrix[j] && deleted_cols[j] > 0 && edge_b_dlmatrix[j] == 1) {
            atomicMax(conflict_col_id, j);
        }
    }
}

__global__ void get_conflict_col_id(int *dl_matrix, int *deleted_cols, int *conflict_col_id, int *conflict_edge, int total_dl_matrix_col_num, int vertex_num) {
    // Calculate base indices to minimize repetitive calculations
    int base_a = conflict_edge[0] * total_dl_matrix_col_num;
    int base_b = conflict_edge[1] * total_dl_matrix_col_num;

    // Loop over columns with step size of blockDim.x
    for (int j = threadIdx.x; j < total_dl_matrix_col_num; j += blockDim.x) {
        // Use pre-computed base indices for value checks and atomicMax
        if (dl_matrix[base_a + j] == dl_matrix[base_b + j] && deleted_cols[j] > 0 && dl_matrix[base_b + j] == 1) {
            atomicMax(conflict_col_id, j);
        }
    }
    // Synchronize threads within block
    __syncthreads();
}