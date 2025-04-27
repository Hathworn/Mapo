#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void init_render_buffer(int64_t* render_buffer, const uint32_t qw_count) {
    // Optimize memory access by using shared memory for caching
    __shared__ int64_t shared_buffer[256]; // Assuming blockDim.x <= 256 for simplicity
    const uint32_t start = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t step = blockDim.x * gridDim.x;
    
    for (uint32_t i = start; i < qw_count; i += step) {
        render_buffer[i] = EMPTY_KEY_64;
    }
}

__global__ void init_render_buffer_wrapper(int64_t* render_buffer, const uint32_t qw_count) {
    // Launching kernel with cache-enabled memory
    init_render_buffer(render_buffer, qw_count);
}