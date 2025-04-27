#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void columnarize_groups(int8_t* columnar_buffer, const int8_t* rowwise_buffer, const size_t row_count, const size_t col_count, const size_t* col_widths, const size_t row_size) {
    const auto thread_index = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure thread index is within bounds
    if (thread_index >= row_count) {
        return;
    }
    
    auto read_ptr = rowwise_buffer + thread_index * row_size;

    for (size_t i = 0; i < col_count; ++i) {
        auto col_base = columnar_buffer + i * row_count * col_widths[i];

        // Coalesce memory access for better performance
        switch (col_widths[i]) {
            case 8: {
                reinterpret_cast<int64_t*>(col_base)[thread_index] = *reinterpret_cast<const int64_t*>(read_ptr);
                break;
            }
            case 4: {
                reinterpret_cast<int32_t*>(col_base)[thread_index] = *reinterpret_cast<const int32_t*>(read_ptr);
                break;
            }
            default: {
                // Handle other column width cases if necessary
                break;
            }
        }
        
        read_ptr += col_widths[i]; // Move read pointer to the next column
    }
}