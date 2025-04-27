#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    // Load cur_weight into a register
    float cur_weight = *cur_tot_weight;
    
    // Compute scaling value if applicable
    float val = 1.0f;
    if (max_count > 0.0f) {
        float new_scale = fmaxf(cur_weight, (float)max_count) / max_count; // Use fmaxf for performance
        val += new_scale - 1.0f; // Combine operations to reduce memory access
    }

    // Use blockDim.x and gridDim.x for efficient iteration
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t stride = blockDim.x * gridDim.x;

    for (int32_t i = idx; i < n; i += stride) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        atomicAdd(&quadratic[diag_idx], val); // Use atomicAdd for potential concurrent access
    }

    // Ensure one thread updates linear
    if (idx == 0) {
        linear[0] += val * prior_offset;
    }
}