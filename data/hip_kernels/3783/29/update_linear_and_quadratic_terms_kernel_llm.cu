#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    float cur_weight = *cur_tot_weight;
    float val = 1.0f;

    if (max_count > 0.0f) {
        // Calculate new scale based on max_count and current weight
        float new_scale = max(cur_weight, static_cast<float>(max_count)) / max_count;
        // Adjust value based on scale change
        val += (new_scale - 1.0f);
    }

    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t stride = blockDim.x * gridDim.x;

    // Optimize loop by reducing redundant index calculation
    for (; idx < n; idx += stride) {
        int32_t diag_idx = ((idx + 1) * (idx + 2) / 2) - 1;
        quadratic[diag_idx] += val;
    }

    // Ensure only one thread updates linear[0]
    if (threadIdx.x == 0) {
        atomicAdd(&linear[0], val * prior_offset);
    }
}