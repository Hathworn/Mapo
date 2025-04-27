#include "hip/hip_runtime.h"
#include "includes.h"

#define EMPTY_KEY_64 0  // Assuming definition; ensure it's defined or passed appropriately

__global__ void init_render_buffer_wrapper(int64_t* render_buffer, const uint32_t qw_count) {
    // Calculate global thread index for the current thread
    const uint32_t index = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t stride = blockDim.x * gridDim.x;
    
    // Use this thread to initialize multiple elements
    for (uint32_t i = index; i < qw_count; i += stride) {
        render_buffer[i] = EMPTY_KEY_64;
    }
}
```
