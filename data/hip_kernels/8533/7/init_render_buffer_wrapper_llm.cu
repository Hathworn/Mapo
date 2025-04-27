#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_render_buffer(int64_t* render_buffer, const uint32_t qw_count) {
    const uint32_t start = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t step = blockDim.x * gridDim.x;

    // Each thread processes multiple elements to improve parallel efficiency
    for (uint32_t i = start; i < qw_count; i += step) {
        render_buffer[i] = EMPTY_KEY_64;
    }
}