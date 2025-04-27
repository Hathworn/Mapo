#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_push_stochastic1(int *g_push_reser, int *s_push_reser, int *g_count_blocks, bool *g_finish, int *g_block_num, int width1)
{
    // Compute global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int thid = y * width1 + x;

    // Copy data from global to shared memory
    s_push_reser[thid] = g_push_reser[thid];

    // Check and update finish flag by the first thread
    if (thid == 0)
    {
        if (*g_count_blocks == 0)
        {
            *g_finish = false;
        }
    }
}