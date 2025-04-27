#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float old_num_frames, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    // Load current weight once into a register to minimize global memory access
    float cur_weight = *cur_tot_weight;

    float new_num_frames = old_num_frames + cur_weight;
    float prior_scale_change = 1.0f;

    if (max_count != 0) {
        float old_prior_scale = max(old_num_frames, (float)max_count) / max_count;
        float new_prior_scale = max(new_num_frames, (float)max_count) / max_count;
        prior_scale_change += new_prior_scale - old_prior_scale;
    }

    // Optimize thread calculation by reducing unnecessary arithmetic
    int32_t i_start = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t i_stride = blockDim.x * gridDim.x;
    for (int32_t i = i_start; i < n; i += i_stride) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        quadratic[diag_idx] += prior_scale_change;
    }

    // Use atomic operation for potential data race; only first thread updates
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        atomicAdd(&linear[0], prior_offset * prior_scale_change);
    }
}