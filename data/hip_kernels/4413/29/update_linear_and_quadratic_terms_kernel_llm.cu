#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_linear_and_quadratic_terms_kernel(int32_t n, float prior_offset, float* cur_tot_weight, int32_t max_count, float* quadratic, float* linear) {
    // Calculate new scale and update val if max_count is valid
    float val = 1.0f;
    float cur_weight = *cur_tot_weight;
    if (max_count > 0.0f) {
        float new_scale = max(cur_weight, (float)max_count) / max_count;
        val += new_scale - 1.0f;
    }
    
    // Calculate index and update quadratic values for each thread
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t stride = blockDim.x * gridDim.x;
    for (int32_t i = idx; i < n; i += stride) {
        int32_t diag_idx = ((i + 1) * (i + 2) / 2) - 1;
        atomicAdd(&quadratic[diag_idx], val); // Use atomicAdd to ensure correctness in concurrent updates
    }

    // Update linear term by one thread in each block
    if (threadIdx.x == 0) {
        atomicAdd(&linear[0], val * prior_offset); // Use atomicAdd for shared memory write
    }
}