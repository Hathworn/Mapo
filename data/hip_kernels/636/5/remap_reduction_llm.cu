#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void remap_reduction(uint32_t *d_reduction, uint32_t *d_mapping, uint32_t *old_d_ij_buf, uint32_t sum_prev_size, uint32_t prev_size, uint32_t *new_d_ij_buf, uint32_t new_size)
{
    uint32_t t_index = blockDim.x * blockIdx.x + threadIdx.x;

    if (t_index < prev_size && d_reduction[t_index]) {  // Combine conditions to reduce branching
        uint32_t index = d_mapping[t_index];
        uint32_t i = old_d_ij_buf[2 * sum_prev_size + t_index];  // Use direct array indexing
        uint32_t j = old_d_ij_buf[2 * sum_prev_size + prev_size + t_index];

        // Swap 'i' and 'j' if needed using conditional operator
        if (!sum_prev_size && j < i) {
            uint32_t temp = i;
            i = j;
            j = temp;
        }

        new_d_ij_buf[2 * sum_prev_size + index] = i;  // Use direct array indexing
        new_d_ij_buf[2 * sum_prev_size + new_size + index] = j;
    }
}