#include "hip/hip_runtime.h"
#include "includes.h"

// Reduced indexing computation and used register memory for `entry_count`
__global__ void set_valid_pos_flag(int32_t* pos_buff, const int32_t* count_buff, const int32_t entry_count) {
    int32_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    int32_t stride = blockDim.x * gridDim.x;
    while (idx < entry_count) {
        if (count_buff[idx]) {
            pos_buff[idx] = VALID_POS_FLAG;
        }
        idx += stride; // Increment using stride once, removing repetitive calculations
    }
}