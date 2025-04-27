#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos_flag(int32_t* pos_buff, const int32_t* count_buff, const int32_t entry_count) {
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate the global thread index
    int32_t step = blockDim.x * gridDim.x;  // Calculate step size

    for (int32_t i = idx; i < entry_count; i += step) {
        if (count_buff[i]) {
            pos_buff[i] = VALID_POS_FLAG;  // Set position flag if count is valid
        }
    }
}