#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(bool* adj_mat, const int N, bool* visited, int* frontier, bool* new_frontier, bool* par_mat, int* cap_mat, int* cap_max_mat) {
    int row_idx = frontier[blockIdx.x+1];
    long offset = N * row_idx;

    int col_idx = threadIdx.x;

    // Cache adj_mat and visited values to reduce global memory accesses
    bool adj_val = adj_mat[offset + col_idx];
    bool not_visited = !visited[col_idx];

    // Use a single conditional check to improve data locality and avoid code duplication
    if(adj_val && not_visited) {
        long offset2 = N * col_idx;
        bool adjacency_check = cap_mat[offset + col_idx] < cap_max_mat[offset + col_idx];
        bool capacity_check = cap_mat[offset2 + row_idx] > 0;

        if(adjacency_check || capacity_check) {
            new_frontier[col_idx] = true;
            par_mat[offset2 + row_idx] = true;
        }
    }
}