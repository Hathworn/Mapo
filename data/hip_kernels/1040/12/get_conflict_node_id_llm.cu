#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void get_conflict_node_id(int *deleted_rows, int *row_group, const int search_depth, int *conflict_node_id, const int total_dl_matrix_row_num) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < total_dl_matrix_row_num) { // Use global index calculation
        if (row_group[i] == search_depth + 1 && deleted_rows[i] < search_depth + 1) {
            atomicMax(conflict_node_id, deleted_rows[i]); // Atomic operation for updating
        }
    }
    __syncthreads(); // Synchronize threads within a block
}