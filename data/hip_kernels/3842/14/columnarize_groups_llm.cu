#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void columnarize_groups(int8_t* columnar_buffer, const int8_t* rowwise_buffer, const size_t row_count, const size_t col_count, const size_t* col_widths, const size_t row_size) {
    // Calculate the thread index for current execution
    const auto thread_index = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    // Return early if the thread index exceeds the row count
    if (thread_index >= row_count) {
        return;
    }

    auto read_ptr = rowwise_buffer + thread_index * row_size;
    auto col_base = columnar_buffer;

    // Use offsets to avoid multiple dereference operations
    size_t offset = 0;
    for (size_t i = 0; i < col_count; ++i) {
        const size_t col_width = col_widths[i];

        switch (col_width) {
            case 8: {
                // Use direct address calculation
                int64_t* write_ptr = reinterpret_cast<int64_t*>(col_base + offset) + thread_index;
                *write_ptr = *reinterpret_cast<const int64_t*>(read_ptr);
            } break;
            case 4: {
                // Use direct address calculation
                int32_t* write_ptr = reinterpret_cast<int32_t*>(col_base + offset) + thread_index;
                *write_ptr = *reinterpret_cast<const int32_t*>(read_ptr);
            } break;
            default:;
        }

        // Increment read and column base by the current column width
        offset += col_width * row_count;
        read_ptr += col_width;  // WARN(miyu): No padding!!
    }
}