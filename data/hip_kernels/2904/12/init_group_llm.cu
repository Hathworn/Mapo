#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_group(int8_t* groups, const size_t group_count, const size_t col_count, const size_t* col_widths, const size_t* init_vals) {
    // Calculate the global thread index
    const auto thread_index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Exit if thread index exceeds the group count
    if (thread_index >= group_count) {
        return;
    }
    
    // Loop through columns to initialize groups
    size_t group_offset = 0; // Accumulate offset
    for (size_t i = 0; i < col_count; ++i) {
        switch (col_widths[i]) {
        case 4:
            // Initialize 4-byte wide data
            *reinterpret_cast<uint32_t*>(groups + group_offset) = *reinterpret_cast<const uint32_t*>(init_vals + i);
            break;
        case 8:
            // Initialize 8-byte wide data
            reinterpret_cast<size_t*>(groups + group_offset)[thread_index] = init_vals[i];
            break;
        default:
            // No initialization if column width doesn't match expected cases
            break;
        }
        group_offset += col_widths[i] * group_count; // Update group offset
    }
}