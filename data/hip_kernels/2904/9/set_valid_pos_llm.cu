#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos(int32_t* pos_buff, int32_t* count_buff, const int32_t entry_count) {
    const int32_t start = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t step = blockDim.x * gridDim.x;

    // Use shared memory to cache count_buff values for better performance
    extern __shared__ int32_t shared_count_buff[];
    
    for (int32_t i = start; i < entry_count; i += step) {
        // Load count_buff into shared memory
        if (i < entry_count) {
            shared_count_buff[threadIdx.x] = count_buff[i];
        }
        __syncthreads(); // Ensure all threads have loaded their values

        // Optimize condition check and data writes
        if (VALID_POS_FLAG == pos_buff[i]) {
            pos_buff[i] = !i ? 0 : shared_count_buff[threadIdx.x - 1];
        }
    }
}