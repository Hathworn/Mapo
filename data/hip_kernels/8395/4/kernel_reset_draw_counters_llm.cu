#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_reset_draw_counters() {
    if (threadIdx.x == 0 && blockIdx.x == 0) { // Only first thread of first block resets the counter
        r_draw_counter = 0;
    }
}