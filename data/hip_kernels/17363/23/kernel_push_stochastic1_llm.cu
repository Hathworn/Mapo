#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_push_stochastic1(int *g_push_reser, int *s_push_reser, int *g_count_blocks, bool *g_finish, int *g_block_num, int width1) {
    // Calculate thread ID
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int thid = y * width1 + x;

    // Copy data from global to shared memory
    if (thid < width1 * gridDim.y * blockDim.y) {  // Avoid out-of-bounds memory access
        s_push_reser[thid] = g_push_reser[thid];
    }

    // First thread checks and updates the finish flag
    if (thid == 0) {
        if (atomicExch(g_count_blocks, *g_count_blocks) == 0) {  // Use atomicExch for thread-safe reading
            *g_finish = false;
        }
    }
}