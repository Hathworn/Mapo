#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void set_valid_pos_flag(int32_t* pos_buff, const int32_t* count_buff, const int32_t entry_count) {
    const int32_t start = blockIdx.x * blockDim.x + threadIdx.x;
    const int32_t step = blockDim.x * gridDim.x;
    
    // Use shared memory for better performance if needed
    for (int32_t i = start; i < entry_count; i += step) {
        if (count_buff[i]) {
            pos_buff[i] = VALID_POS_FLAG;
        }
    }
}