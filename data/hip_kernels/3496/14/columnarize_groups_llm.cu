#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void columnarize_groups(int8_t* columnar_buffer, const int8_t* rowwise_buffer, const size_t row_count, const size_t col_count, const size_t* col_widths, const size_t row_size) {
    // Calculate 1D flattened thread index
    const auto thread_index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within bounds
    if (thread_index >= row_count) {
        return;
    }
    
    // Calculate pointers for reading and writing
    auto read_ptr = rowwise_buffer + thread_index * row_size;
    
    // Loop through each column
    for (size_t i = 0; i < col_count; ++i) {
        auto col_base = columnar_buffer + i * row_count * col_widths[i];
        
        // Use shared memory to reduce redundant calculations (if needed to optimize further)
        switch (col_widths[i]) {
            case 8: {
                // Write in chunks of int64
                reinterpret_cast<int64_t*>(col_base)[thread_index] = *reinterpret_cast<const int64_t*>(read_ptr);
                break;
            }
            case 4: {
                // Write in chunks of int32
                reinterpret_cast<int32_t*>(col_base)[thread_index] = *reinterpret_cast<const int32_t*>(read_ptr);
                break;
            }
            // Additional case optimization can be considered if col_widths has other frequent values
            default: break;
        }

        // Move read pointer forward by column width
        read_ptr += col_widths[i];
    }
}