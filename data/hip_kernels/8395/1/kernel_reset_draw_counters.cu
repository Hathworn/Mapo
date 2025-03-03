#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_reset_draw_counters() {
r_draw_counter = 0;
}