#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos_flag(int32_t* pos_buff, const int32_t* count_buff, const int32_t entry_count) {
    // Use shared memory to reduce global memory accesses
    __shared__ int32_t shared_buff[1024];
    
    const int32_t start = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t step = blockDim.x * gridDim.x;
    
    for (int32_t i = start; i < entry_count; i += step) {
        // Load data to shared memory from global memory
        shared_buff[threadIdx.x] = count_buff[i];
        __syncthreads();
        
        // Check condition and update pos_buff
        if (shared_buff[threadIdx.x]) {
            pos_buff[i] = VALID_POS_FLAG;
        }
        __syncthreads();
    }
}