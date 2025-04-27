#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_group(int8_t* groups, const size_t group_count, const size_t col_count, const size_t* col_widths, const size_t* init_vals) {
    // Calculate the flattened thread index
    const auto thread_index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index does not exceed group count
    if (thread_index >= group_count) {
        return;
    }
    
    // Iterate over columns
    for (size_t i = 0, offset = 0; i < col_count; offset += col_widths[i++] * group_count) {
        int8_t* group_ptr = groups + offset;
        switch (col_widths[i]) {
            case 4:
                // Efficiently handle 4-byte width using reinterpret cast
                *reinterpret_cast<uint32_t*>(group_ptr + thread_index * 4) =
                    *reinterpret_cast<const uint32_t*>(init_vals + i);
                break;
            case 8:
                // Efficiently handle 8-byte width with correct indexing
                reinterpret_cast<size_t*>(group_ptr)[thread_index] = init_vals[i];
                break;
            default:
                break;
        }
    }
}