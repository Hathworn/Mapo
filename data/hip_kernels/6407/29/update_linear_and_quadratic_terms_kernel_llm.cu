#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float old_num_frames, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    float cur_weight = *cur_tot_weight;
    float new_num_frames = old_num_frames + cur_weight;
    float prior_scale_change = 1.0f;

    if (max_count != 0.0f) {
        float old_prior_scale = fmaxf(old_num_frames, (float)max_count) / max_count;
        float new_prior_scale = fmaxf(new_num_frames, (float)max_count) / max_count;
        prior_scale_change += new_prior_scale - old_prior_scale;
    }

    // Use shared memory to reduce global memory accesses
    __shared__ float partial_quadratic[256];  // Adjust size according to maximum blockDim.x
    int32_t tid = threadIdx.x;
    partial_quadratic[tid] = 0.0f;

    for (int32_t i = blockIdx.x * blockDim.x + tid; i < n; i += blockDim.x * gridDim.x) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        partial_quadratic[tid] += prior_scale_change;
    }
    __syncthreads();

    // Reduce results from partial_quadratic array
    if (tid == 0) {
        float sum = 0.0f;
        for (int32_t j = 0; j < blockDim.x; ++j) {
            sum += partial_quadratic[j];
        }
        atomicAdd(&quadratic[((blockIdx.x + 1) * (blockIdx.x + 2) / 2) - 1], sum);
    }

    // Update linear term only once
    if (tid == 0 && blockIdx.x == 0) {
        atomicAdd(&linear[0], prior_offset * prior_scale_change);
    }
}