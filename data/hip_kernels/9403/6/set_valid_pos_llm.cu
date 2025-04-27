#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos(int32_t* pos_buff, int32_t* count_buff, const int32_t entry_count) {
    const int32_t start = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t step = blockDim.x * gridDim.x;
    
    // Use shared memory to minimize global memory access for frequently accessed data
    __shared__ int32_t shared_count_buff[256]; // Assuming blockDim.x <= 256

    for (int32_t i = start; i < entry_count; i += step) {
        if (VALID_POS_FLAG == pos_buff[i]) {
            // Use shared memory to check and update counts
            if (threadIdx.x > 0) {
                shared_count_buff[threadIdx.x] = count_buff[i - 1];
            }
            __syncthreads(); // Ensure all threads have updated shared memory

            pos_buff[i] = threadIdx.x == 0 ? 0 : shared_count_buff[threadIdx.x];

            __syncthreads(); // Ensure all writes to global memory are complete
        }
    }
}