#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void respond_kernel(int64_t *out, const int64_t *proposal, const int64_t *rowptr, const int64_t *col, int64_t numel) {
    const int64_t thread_idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (thread_idx < numel) {
        if (out[thread_idx] != -2) return;  // Only visit red nodes.

        bool has_unmatched_neighbor = false;
        int64_t start_idx = rowptr[thread_idx];
        int64_t end_idx = rowptr[thread_idx + 1];

        // Unrolling for efficiency, assuming row degree is small
        for (int64_t i = start_idx; i < end_idx; i++) {
            int64_t v = col[i];

            if (out[v] < 0) has_unmatched_neighbor = true; // Unmatched neighbor found.

            if (out[v] == -1 && proposal[v] == thread_idx) {
                // Match first blue neighbor v which proposed to u.
                int64_t min_thread_v = min(thread_idx, v);
                out[thread_idx] = min_thread_v;
                out[v] = min_thread_v;
                break;
            }
        }

        if (!has_unmatched_neighbor) {
            out[thread_idx] = thread_idx;
        }
    }
}