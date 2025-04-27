#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    // Load cur_weight to a register
    float cur_weight = *cur_tot_weight;
    float val = 1.0f;

    // Avoid redundant type casting
    if (max_count > 0.0f) {
        float new_scale = fmaxf(cur_weight, (float)max_count) / max_count;
        val += (new_scale - 1.0f);
    }

    // Use thread indices to avoid branch divergence in the loop
    for (int32_t i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        quadratic[diag_idx] += val;
    }

    // Use warp divergence to update linear
    if (threadIdx.x == 0) {
        atomicAdd(&linear[0], val * prior_offset);
    }
}