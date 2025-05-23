#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float old_num_frames, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    float cur_weight = *cur_tot_weight;
    float new_num_frames = old_num_frames + cur_weight;
    float prior_scale_change = 1.0f;

    if(max_count != 0.0f) {
        float old_prior_scale = max(old_num_frames, (float)max_count) / max_count;
        float new_prior_scale = max(new_num_frames, (float)max_count) / max_count;
        prior_scale_change += new_prior_scale - old_prior_scale;
    }

    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;    
    int32_t stride = blockDim.x * gridDim.x;    
    for (; idx < n; idx += stride) {
        int32_t diag_idx = ((idx + 1) * (idx + 2) / 2) - 1;
        quadratic[diag_idx] += prior_scale_change; // Efficient parallel updates
    }

    __syncthreads(); // Ensure all threads update before proceeding

    if (threadIdx.x == 0 && blockIdx.x == 0) {
        linear[0] += prior_offset * prior_scale_change; // Update linear term
    }
}