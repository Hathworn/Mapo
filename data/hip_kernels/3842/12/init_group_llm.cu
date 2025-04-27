#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_group(int8_t* groups, const size_t group_count, const size_t col_count, const size_t* col_widths, const size_t* init_vals) {
    // Calculate global thread index
    const auto thread_index = blockIdx.x * blockDim.x + threadIdx.x;

    // Return if thread index is greater than or equal to group count
    if (thread_index >= group_count) {
        return;
    }

    // Optimize loop increments and data index calculations
    size_t offset = 0;
    for (size_t i = 0; i < col_count; ++i) {
        if (col_widths[i] == 4) {
            *reinterpret_cast<uint32_t*>(groups + offset + thread_index * col_widths[i]) = 
                *reinterpret_cast<const uint32_t*>(init_vals + i);
        } else if (col_widths[i] == 8) {
            reinterpret_cast<size_t*>(groups + offset)[thread_index] = init_vals[i];
        }
        offset += col_widths[i] * group_count; // Increase offset by col_width[i] * group_count
    }
}