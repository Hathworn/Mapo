#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_group(int8_t* groups, const size_t group_count, const size_t col_count, const size_t* col_widths, const size_t* init_vals) {
    // Calculate the global thread index
    const auto thread_index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit for threads beyond group_count
    if (thread_index >= group_count) {
        return;
    }
    
    // Loop optimization: remove repeated computations
    for (size_t i = 0, offset = 0; i < col_count; offset += col_widths[i++] * group_count) {
        switch (col_widths[i]) {
            case 4:
                // Use reinterpret_cast for 4-byte case directly
                *reinterpret_cast<uint32_t*>(groups + offset + thread_index * col_widths[i]) =
                *reinterpret_cast<const uint32_t*>(init_vals + i);
                break;
            case 8:
                // Access the groups memory using calculated offset
                reinterpret_cast<size_t*>(groups + offset)[thread_index] = init_vals[i];
                break;
            default:
                // Handle other cases if necessary
                break;
        }
    }
}