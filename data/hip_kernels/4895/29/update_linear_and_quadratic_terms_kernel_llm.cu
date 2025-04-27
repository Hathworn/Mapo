#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void update_linear_and_quadratic_terms_kernel( int32_t n, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    // Cache cur_weight in a register
    float cur_weight = *cur_tot_weight;
    float val = 1.0f;

    // Optimize computation by avoiding casts
    if (max_count > 0) {
        float new_scale = max(cur_weight, (float)max_count) / max_count;
        float prior_scale_change = new_scale - 1.0f;
        val += prior_scale_change;
    }

    int32_t total_threads = blockDim.x * gridDim.x;
    for (int32_t i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += total_threads) {
        // Calculate diag_idx using register variables to reduce recomputation
        int32_t diag_idx = i * (i + 3) / 2; // Simplified calculation of triangular index
        quadratic[diag_idx] += val;
    }

    // Use a single thread to update the shared linear term
    if (threadIdx.x == 0) {
        atomicAdd(&linear[0], val * prior_offset);
    }
}