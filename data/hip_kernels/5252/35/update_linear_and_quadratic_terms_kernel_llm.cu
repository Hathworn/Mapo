#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    float val = 1.0f;
    float cur_weight = *cur_tot_weight;

    // Pre-calculate new_scale and val, and avoid recomputation in the loop
    if (max_count > 0.0f) {
        float new_scale = max(cur_weight, (float)max_count) / max_count;
        val += new_scale - 1.0f;
    }

    // Utilize variables for indexing to avoid repeated calculation
    int32_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t stride = blockDim.x * gridDim.x;

    for (int32_t i = tid; i < n; i += stride) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        quadratic[diag_idx] += val;
    }

    // Use one thread per block for a reduction on linear, to avoid collisions
    if (tid == 0) {
        atomicAdd(&linear[0], val * prior_offset);
    }
}