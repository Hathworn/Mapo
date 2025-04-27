#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void init_render_buffer(int64_t* render_buffer, const uint32_t qw_count) {
    const uint32_t start = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t step = blockDim.x * gridDim.x;
    for (uint32_t i = start; i < qw_count; i += step) {
        render_buffer[i] = EMPTY_KEY_64;  // Initialize element to EMPTY_KEY_64
    }
}

__global__ void init_render_buffer_wrapper(int64_t* render_buffer, const uint32_t qw_count) {
    // Calculate thread's unique index across grid
    const uint32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Efficient index stride across all threads
    for (uint32_t i = idx; i < qw_count; i += blockDim.x * gridDim.x) {
        render_buffer[i] = EMPTY_KEY_64;  // Assign EMPTY_KEY_64 to the buffer
    }
}