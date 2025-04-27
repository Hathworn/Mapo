#include "hip/hip_runtime.h"
#include "includes.h"

// Copyright Douglas Goddard 2016
// Licensed under the MIT license

__global__ void remap_reduction(uint32_t *d_reduction, uint32_t *d_mapping, uint32_t *old_d_ij_buf, uint32_t sum_prev_size, uint32_t prev_size, uint32_t *new_d_ij_buf, uint32_t new_size)
{
    uint32_t t_index = blockDim.x * blockIdx.x + threadIdx.x;
    if (t_index >= prev_size) return;  // Early exit for out-of-bounds threads
    if (!d_reduction[t_index]) return; // Skip unnecessary computations
    
    uint32_t index = d_mapping[t_index];
    uint32_t offset = 2 * sum_prev_size; // Precompute common offset
    uint32_t i = old_d_ij_buf[offset + t_index];
    uint32_t j = old_d_ij_buf[offset + prev_size + t_index];

    // sort pairs in first round
    if (!sum_prev_size && j < i) {
        uint32_t temp = i; // Use a temporary variable for clarity and readability
        i = j;
        j = temp;
    }

    new_d_ij_buf[offset + index] = i;
    new_d_ij_buf[offset + new_size + index] = j;
}