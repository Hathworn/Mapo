#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float old_num_frames, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    // Using local variables to avoid repeated global access
    float cur_weight = *cur_tot_weight;
    float new_num_frames = old_num_frames + cur_weight;
    float prior_scale_change = 1.0f;

    // Avoid checking non-zero with floating point
    if(max_count > 0) {
        float old_prior_scale = max(old_num_frames, (float)max_count) / max_count;
        float new_prior_scale = max(new_num_frames, (float)max_count) / max_count;
        prior_scale_change += new_prior_scale - old_prior_scale;
    }

    // Optimize loop using built-in device computation
    for (int32_t idx = blockIdx.x * blockDim.x + threadIdx.x; idx < n; idx += blockDim.x * gridDim.x) {
        int32_t diag_idx = ((idx + 1) * (idx + 2) / 2) - 1;
        atomicAdd(&quadratic[diag_idx], prior_scale_change); // Ensure atomic operation for data integrity
    }

    // Reduce branching, use atomic operation for linear update
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        atomicAdd(&linear[0], prior_offset * prior_scale_change); // Ensure atomic operation for data integrity
    }
}