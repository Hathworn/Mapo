#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void non_diag_mask_kernel(const int64_t *row_data, const int64_t *col_data, bool *out_data, int64_t N, int64_t k, int64_t num_diag, int64_t numel) {
    
    int64_t thread_idx = blockDim.x * blockIdx.x + threadIdx.x;

    if (thread_idx < numel) {
        int64_t r = row_data[thread_idx], c = col_data[thread_idx];
        int64_t index = thread_idx + ((k < 0) ? r + k : r);  // Compute base index

        if (k < 0) {
            if (r + k < 0 || r + k >= N) {
                out_data[thread_idx + num_diag] = true;  // Handle off-diagonal cases
            } else {
                out_data[index + ((r + k > c) ? 0 : 1)] = true;  // Optimize index update
            }
        } else {
            if (r + k >= N) {
                out_data[thread_idx + num_diag] = true;
            } else {
                out_data[index + ((r + k > c) ? 0 : 1)] = true;
            }
        }
    }
}