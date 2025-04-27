#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_group(int8_t* groups, const size_t group_count, const size_t col_count, const size_t* col_widths, const size_t* init_vals) {
    // Calculate the global thread index
    const size_t thread_index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Early return if the thread index is out of bounds
    if (thread_index >= group_count) return;

    // Use a temporary pointer for efficiency
    int8_t* group_ptr = groups + thread_index;

    for (size_t i = 0; i < col_count; ++i) {
        // Check the column width and initialize accordingly
        if (col_widths[i] == 4) {
            *reinterpret_cast<uint32_t*>(group_ptr) = *reinterpret_cast<const uint32_t*>(&init_vals[i]);
        } else if (col_widths[i] == 8) {
            *reinterpret_cast<size_t*>(group_ptr) = init_vals[i];
        }
        // Move the group pointer by the current column width times the group count
        group_ptr += col_widths[i] * group_count;
    }
}