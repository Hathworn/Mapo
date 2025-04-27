#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos(int32_t* pos_buff, int32_t* count_buff, const int32_t entry_count) {
    const int32_t start = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t step = blockDim.x * gridDim.x;
    for (int32_t i = start; i < entry_count; i += step) {
        // Efficient memory access by avoiding redundant calculations
        int32_t pos_val = pos_buff[i];
        if (VALID_POS_FLAG == pos_val) {
            pos_buff[i] = (i == 0) ? 0 : count_buff[i - 1];
        }
    }
}