#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos(int32_t* pos_buff, int32_t* count_buff, const int32_t entry_count) {
    const int32_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t stride = blockDim.x * gridDim.x;

    // Using local cache to reduce global memory access
    int32_t local_pos, local_count;
    for (int32_t i = idx; i < entry_count; i += stride) {
        local_pos = pos_buff[i];
        if (VALID_POS_FLAG == local_pos) {
            local_count = (i == 0) ? 0 : count_buff[i - 1];
            pos_buff[i] = local_count;
        }
    }
}