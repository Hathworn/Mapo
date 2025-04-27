#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_push_atomic2(int *g_terminate, int *g_push_reser, int *s_push_reser, int *g_block_num, int width1)
{
    // Calculate unique thread ID across the grid
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int thid = y * width1 + x;

    // Check the condition and set the g_terminate flag using atomic operations
    if (s_push_reser[thid] != g_push_reser[thid]) {
        atomicOr(&g_terminate[blockIdx.y * (*g_block_num) + blockIdx.x], 1);
    }
}