#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos_flag(int32_t* pos_buff, const int32_t* count_buff, const int32_t entry_count) {
    // Cache the thread and grid information
    const int32_t start = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t step = blockDim.x * gridDim.x;
    
    // Cache data in registers for faster access
    int32_t tid = start;
    
    while (tid < entry_count) {
        if (count_buff[tid]) {
            pos_buff[tid] = VALID_POS_FLAG;
        }
        tid += step;  // Increment by the step size
    }
}