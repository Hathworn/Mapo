#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_valid_pos_flag(int32_t* pos_buff, const int32_t* count_buff, const int32_t entry_count) {
    const int32_t i = threadIdx.x + blockDim.x * blockIdx.x;
    // Ensure that thread index is within the entry_count range
    if (i < entry_count && count_buff[i]) {
        pos_buff[i] = VALID_POS_FLAG;
    }
}