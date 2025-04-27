#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float old_num_frames, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    float cur_weight = *cur_tot_weight;
    float new_num_frames = old_num_frames + cur_weight;
    float prior_scale_change = 1.0f;

    if (max_count != 0.0f) {
        float old_prior_scale = max(old_num_frames, (float)max_count) / max_count;
        float new_prior_scale = max(new_num_frames, (float)max_count) / max_count;
        prior_scale_change += new_prior_scale - old_prior_scale;
    }

    // Optimize loop by allowing each thread to handle multiple elements if necessary.
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t stride = blockDim.x * gridDim.x;

    for (; i < n; i += stride) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        quadratic[diag_idx] += prior_scale_change;
    }

    // Use shared memory to accumulate linear term from all threads in a block
    __shared__ float local_linear_update;

    if (threadIdx.x == 0) {
        local_linear_update = 0.0f;
    }
    __syncthreads();

    atomicAdd(&local_linear_update, (threadIdx.x == 0 && blockIdx.x == 0) ? prior_offset * prior_scale_change : 0.0f);
    __syncthreads();

    if (threadIdx.x == 0) {
        atomicAdd(&linear[0], local_linear_update);
    }
}