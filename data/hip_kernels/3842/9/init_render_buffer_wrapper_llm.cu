#include "hip/hip_runtime.h"
#include "includes.h"

#define EMPTY_KEY_64 0  // Ensure EMPTY_KEY_64 is defined

__global__ void init_render_buffer(int64_t* render_buffer, const uint32_t qw_count) {
    const uint32_t index = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t stride = blockDim.x * gridDim.x;

    // Use index stride loop pattern for efficiency
    for (uint32_t i = index; i < qw_count; i += stride) {
        render_buffer[i] = EMPTY_KEY_64;
    }
}