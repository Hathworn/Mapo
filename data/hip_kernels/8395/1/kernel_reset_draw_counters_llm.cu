#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_reset_draw_counters() {
    // Use atomic operation to reset counter to avoid race conditions
    atomicExch(&r_draw_counter, 0);
}