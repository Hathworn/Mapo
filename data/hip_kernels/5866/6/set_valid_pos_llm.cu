#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_valid_pos(int32_t* pos_buff, int32_t* count_buff, const int32_t entry_count) {
    const int32_t start = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t step = blockDim.x * gridDim.x;

    // Unrolling the loop for increased performance
    for (int32_t i = start; i < entry_count; i += step * 4) {
        if (VALID_POS_FLAG == pos_buff[i]) {
            pos_buff[i] = !i ? 0 : count_buff[i - 1];
        }
        if (i + step < entry_count && VALID_POS_FLAG == pos_buff[i + step]) {
            pos_buff[i + step] = (i + step == 0) ? 0 : count_buff[i + step - 1];
        }
        if (i + 2 * step < entry_count && VALID_POS_FLAG == pos_buff[i + 2 * step]) {
            pos_buff[i + 2 * step] = (i + 2 * step == 0) ? 0 : count_buff[i + 2 * step - 1];
        }
        if (i + 3 * step < entry_count && VALID_POS_FLAG == pos_buff[i + 3 * step]) {
            pos_buff[i + 3 * step] = (i + 3 * step == 0) ? 0 : count_buff[i + 3 * step - 1];
        }
    }
}