#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    float cur_weight = *cur_tot_weight;
    float val = 1.0f;

    // Prefetch common value outside the loop for efficiency
    float new_scale = (max_count > 0) ? max(cur_weight, (float)max_count) / max_count : 0.0f;
    val += new_scale - 1.0f;

    // Calculate global thread index
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better performance
    for (int32_t i = idx; i < n; i += blockDim.x * gridDim.x) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        quadratic[diag_idx] += val;
    }

    // Reduce condition checks for thread synchronization
    if (threadIdx.x == 0) {
        atomicAdd(&linear[0], val * prior_offset);
    }
}