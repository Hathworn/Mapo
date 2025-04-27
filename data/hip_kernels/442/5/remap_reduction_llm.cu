#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for remap reduction
__global__ void remap_reduction(uint32_t *d_reduction, uint32_t *d_mapping, uint32_t *old_d_ij_buf, uint32_t sum_prev_size, uint32_t prev_size, uint32_t *new_d_ij_buf, uint32_t new_size)
{
    uint32_t t_index = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread is within bounds
    if (t_index < prev_size) {
        // Check if current reduction element is active
        if (d_reduction[t_index]) {
            uint32_t index = d_mapping[t_index];
            uint32_t offset = 2 * sum_prev_size + t_index;
            uint32_t i = old_d_ij_buf[offset];
            uint32_t j = old_d_ij_buf[offset + prev_size];

            // Sort pairs if needed when sum_prev_size is zero
            if (!sum_prev_size && j < i) {
                uint32_t temp = i;
                i = j;
                j = temp;
            }

            // Remap to new buffer
            new_d_ij_buf[2 * sum_prev_size + index] = i;
            new_d_ij_buf[2 * sum_prev_size + new_size + index] = j;
        }
    }
}