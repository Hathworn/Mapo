#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_group(int8_t* groups, const size_t group_count, const size_t col_count, const size_t* col_widths, const size_t* init_vals) {
    const auto thread_index = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    if (thread_index >= group_count) {
        return;
    }

    for (size_t i = 0; i < col_count; groups += col_widths[i++] * group_count) {
        // Use shared memory for optimization
        __shared__ size_t shared_col_widths[256]; // assuming col_count won't exceed 256
        __shared__ size_t shared_init_vals[256];  // assuming col_count won't exceed 256

        if (threadIdx.x == 0) {
            shared_col_widths[i] = col_widths[i];
            shared_init_vals[i] = init_vals[i];
        }
        __syncthreads();

        switch (shared_col_widths[i]) {
            case 4:
                *reinterpret_cast<uint32_t*>(groups) = *reinterpret_cast<const uint32_t*>(shared_init_vals + i);
                break;
            case 8:
                reinterpret_cast<size_t*>(groups)[thread_index] = shared_init_vals[i];
                break;
            default:;
        }
    }
}