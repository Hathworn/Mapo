#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void columnarize_groups(int8_t* columnar_buffer, const int8_t* rowwise_buffer, const size_t row_count, const size_t col_count, const size_t* col_widths, const size_t row_size) {
    const auto thread_index = blockIdx.x * blockDim.x + threadIdx.x;
    if (thread_index >= row_count) {
        return;
    }

    auto read_ptr = rowwise_buffer + thread_index * row_size;
    auto col_base = columnar_buffer;

    for (size_t i = 0; i < col_count; ++i) {
        switch (col_widths[i]) {
            case 8: {
                // Use int64_t pointer for 8-byte wide data
                reinterpret_cast<int64_t*>(col_base)[thread_index] = *reinterpret_cast<const int64_t*>(read_ptr);
                break;
            }
            case 4: {
                // Use int32_t pointer for 4-byte wide data
                reinterpret_cast<int32_t*>(col_base)[thread_index] = *reinterpret_cast<const int32_t*>(read_ptr);
                break;
            }
            default:; // Handle other cases if needed
        }
        col_base += col_widths[i] * row_count;
        read_ptr += col_widths[i];
    }
}