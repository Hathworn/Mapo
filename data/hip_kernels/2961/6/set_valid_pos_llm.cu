#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos(int32_t* pos_buff, int32_t* count_buff, const int32_t entry_count) {
    const int32_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t stride = blockDim.x * gridDim.x;
    
    // Use shared memory to improve memory access efficiency
    extern __shared__ int32_t shared_count_buff[];
    
    for (int32_t i = idx; i < entry_count; i += stride) {
        shared_count_buff[threadIdx.x] = count_buff[i];  // Load into shared memory
        __syncthreads();  // Ensure all loads are completed

        if (VALID_POS_FLAG == pos_buff[i]) {
            // Efficient computation using shared memory
            pos_buff[i] = !i ? 0 : shared_count_buff[threadIdx.x - 1];
        }
        
        __syncthreads();  // Ensure all writes are completed
    }
}