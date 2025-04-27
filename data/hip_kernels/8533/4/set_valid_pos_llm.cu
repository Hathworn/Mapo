#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_valid_pos(int32_t* pos_buff, int32_t* count_buff, const int32_t entry_count) {
    const int32_t start = threadIdx.x + blockDim.x * blockIdx.x;
    const int32_t step = blockDim.x * gridDim.x;

    // Use shared memory for better performance
    __shared__ int32_t shared_count[256]; // Assume a typical blockDim.x size

    for (int32_t i = start; i < entry_count; i += step) {
        if (VALID_POS_FLAG == pos_buff[i]) {
            // Load previous count value into shared memory to minimize memory access time
            shared_count[threadIdx.x] = !i ? 0 : count_buff[i - 1];
            syncthreads(); // Ensure all threads have loaded their value before using
            pos_buff[i] = shared_count[threadIdx.x];
        }
    }
}