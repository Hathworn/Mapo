#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void get_vertex_row_group(int *row_group, bool *dl_matrix, const int vertex_num, const int total_dl_matrix_row_num, const int total_dl_matrix_col_num) {
    // Use thread synchronization for efficiency
    for (int i = threadIdx.x; i < total_dl_matrix_row_num; i += blockDim.x) {
        int sum = 0; // Reduce global memory access
        for (int j = 0, cur_index = i * total_dl_matrix_col_num; j < vertex_num; j++, cur_index++) {
            sum += (int)(dl_matrix[cur_index]) * (j + 1);
        }
        row_group[i] = sum;
    }
    __syncthreads(); // Ensure all threads complete before exit
}

__global__ void get_vertex_row_group(int *row_group, int *dl_matrix, const int vertex_num, const int total_dl_matrix_row_num, const int total_dl_matrix_col_num) {
    // Use optimized index calculation
    for (int i = threadIdx.x; i < total_dl_matrix_row_num; i += blockDim.x) {
        int sum = 0; // Accumulate results locally
        for (int j = 0; j < vertex_num; j++) {
            sum += dl_matrix[i * total_dl_matrix_col_num + j] * (j + 1);
        }
        row_group[i] = sum;
    }
    __syncthreads(); // Ensure memory consistency
}