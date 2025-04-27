#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

//Check for edges valid to be part of augmented path

//Update frontier

__global__ void kernel(bool* adj_mat, const int N, bool* visited, int* frontier, bool* new_frontier, bool* par_mat, int* cap_mat, int* cap_max_mat) {
    // Obtain row index from frontier using grid stride loop
    int block_offset = blockDim.x * blockIdx.x;
    for (int row_shift = block_offset + threadIdx.x; row_shift < blockDim.x * (blockIdx.x + 1); row_shift += blockDim.x) {
        int row_idx = frontier[row_shift + 1];
        long row_offset = N * row_idx;

        // Use shared memory for col_idx computation
        extern __shared__ int shared_row_idxs[];
        shared_row_idxs[threadIdx.x] = row_idx;
        __syncthreads();

        // Process columns
        for (int col_idx = 0; col_idx < N; ++col_idx) {
            long offset2 = N * col_idx;
            if (adj_mat[row_offset + col_idx] && (cap_mat[row_offset + col_idx] < cap_max_mat[row_offset + col_idx]) && !visited[col_idx]) {
                new_frontier[col_idx] = true;
                par_mat[offset2 + shared_row_idxs[threadIdx.x]] = true;
            }

            if (adj_mat[offset2 + row_idx] && (cap_mat[offset2 + row_idx] > 0) && !visited[col_idx]) {
                new_frontier[col_idx] = true;
                par_mat[offset2 + shared_row_idxs[threadIdx.x]] = true;
            }
        }
    }
}