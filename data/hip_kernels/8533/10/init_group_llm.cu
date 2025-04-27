#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_group(int8_t* groups, const size_t group_count, const size_t col_count, const size_t* col_widths, const size_t* init_vals) {
    const auto thread_index = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;
    if (thread_index >= group_count) {
        return;
    }
    
    // Loop unrolling for improved performance
    int8_t* group_ptr = groups + thread_index;
    for (size_t i = 0; i < col_count; ++i) {
        size_t width = col_widths[i];
        if (width == 4) {
            *reinterpret_cast<uint32_t*>(group_ptr + i * group_count * width) = *reinterpret_cast<const uint32_t*>(init_vals + i);
        } else if (width == 8) {
            *reinterpret_cast<size_t*>(group_ptr + i * group_count * width) = init_vals[i];
        }
    }
}