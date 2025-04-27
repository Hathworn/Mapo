#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos_flag(int32_t* pos_buff, const int32_t* count_buff, const int32_t entry_count) {
    const int32_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    // Ensure the thread index does not surpass entry_count
    if (idx < entry_count && count_buff[idx]) { 
        pos_buff[idx] = VALID_POS_FLAG;
    }
}