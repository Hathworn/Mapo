#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void columnarize_groups(int8_t* columnar_buffer, const int8_t* rowwise_buffer, const size_t row_count, const size_t col_count, const size_t* col_widths, const size_t row_size) {
    const auto thread_index =
        threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Ensure the thread index is within bounds
    if (thread_index >= row_count) return;

    auto read_ptr = rowwise_buffer + thread_index * row_size;
    auto col_base = columnar_buffer;

    // Loop through columns
    for (size_t i = 0; i < col_count; ++i) {
        auto col_offset = thread_index;
        
        // DRY principle applied for memory casting and copying
        switch (col_widths[i]) {
            case 8:
                *reinterpret_cast<int64_t*>(col_base + col_offset * 8) = 
                    *reinterpret_cast<const int64_t*>(read_ptr);
                break;
            case 4:
                *reinterpret_cast<int32_t*>(col_base + col_offset * 4) = 
                    *reinterpret_cast<const int32_t*>(read_ptr);
                break;
            default:
                // Safe default action, handle other sizes or do nothing; currently no action
                break;
        }
        col_base += col_widths[i] * row_count;
        read_ptr += col_widths[i]; // POSSIBLE ISSUE: No handling of padding
    }
}