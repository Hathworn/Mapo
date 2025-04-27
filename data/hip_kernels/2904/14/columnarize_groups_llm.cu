#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void columnarize_groups(int8_t* columnar_buffer, const int8_t* rowwise_buffer, const size_t row_count, const size_t col_count, const size_t* col_widths, const size_t row_size) {
    // Calculate unique thread index in 1D within the grid.
    const auto thread_index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Exit if thread is out of bounds.
    if (thread_index >= row_count) return;
    
    auto read_ptr = rowwise_buffer + thread_index * row_size;
    auto col_base = columnar_buffer;
    
    // Iterate through each column.
    for (size_t i = 0; i < col_count; ++i) {
        // Use switch statement for different column widths
        switch (col_widths[i]) {
            case 8: {
                // Typecast pointers and perform write operation for width 8.
                int64_t* write_ptr = reinterpret_cast<int64_t*>(col_base) + thread_index;
                *write_ptr = *reinterpret_cast<const int64_t*>(read_ptr);
                break;
            }
            case 4: {
                // Typecast pointers and perform write operation for width 4.
                int32_t* write_ptr = reinterpret_cast<int32_t*>(col_base) + thread_index;
                *write_ptr = *reinterpret_cast<const int32_t*>(read_ptr);
                break;
            }
            default:;
        }
        // Move column base and read pointer as per current column's width.
        col_base += col_widths[i] * row_count;
        read_ptr += col_widths[i];
    }
}