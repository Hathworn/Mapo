#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float old_num_frames, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    float cur_weight = *cur_tot_weight;

    // Precompute common terms outside the loop
    float new_num_frames = old_num_frames + cur_weight;
    float old_prior_scale = (max_count != 0.0f) ? max(old_num_frames, (float)max_count) / max_count : 0.0f;
    float new_prior_scale = (max_count != 0.0f) ? max(new_num_frames, (float)max_count) / max_count : 0.0f;
    float prior_scale_change = 1.0f + new_prior_scale - old_prior_scale;

    int32_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t stride = blockDim.x * gridDim.x;
    
    // Use a stride loop to replace original loop
    for (int32_t i = tid; i < n; i += stride) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        quadratic[diag_idx] += prior_scale_change;
    }

    // Perform atomic operation for safety in multi-thread environment
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        atomicAdd(&linear[0], prior_offset * prior_scale_change);
    }
}