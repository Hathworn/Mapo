#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel( int32_t n, float old_num_frames, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    float cur_weight = *cur_tot_weight;

    float new_num_frames = old_num_frames + cur_weight;
    float prior_scale_change = 1.0f;

    if (max_count != 0.0f) {
        float old_prior_scale = fmaxf(old_num_frames, (float)max_count) / max_count;
        float new_prior_scale = fmaxf(new_num_frames, (float)max_count) / max_count;
        prior_scale_change += new_prior_scale - old_prior_scale;
    }

    // Optimize loop by improving calculation with shared memory
    for (int32_t i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        atomicAdd(&quadratic[diag_idx], prior_scale_change);  // Use atomic operation to avoid race conditions
    }

    // Utilize potential unused threads for linear array update
    __shared__ float linear_shared;  // Shared variable to accumulate updates
    if (threadIdx.x == 0) {
        linear_shared = 0.0f;
    }
    __syncthreads();
    
    // Each block will only call this once
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        atomicAdd(&linear_shared, prior_offset * prior_scale_change);
    }
    __syncthreads();

    if (threadIdx.x == 0 && blockIdx.x == 0) {
        atomicAdd(&linear[0], linear_shared);
    }
}