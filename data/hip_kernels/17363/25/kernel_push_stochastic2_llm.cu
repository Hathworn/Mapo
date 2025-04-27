#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_push_stochastic2(int *g_terminate, int *g_relabel_mask, int *g_push_reser, int *s_push_reser, int *d_stochastic, int *g_block_num, int width1)
{
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int thid = y * width1 + x;

    // Check if s_push_reser and g_push_reser differ; set terminate flag
    if (s_push_reser[thid] != g_push_reser[thid])
    {
        g_terminate[blockIdx.y * (*g_block_num) + blockIdx.x] = 1;
    }

    // Check relabel mask; set stochastic flag
    if (g_relabel_mask[thid] == 1)
    {
        d_stochastic[blockIdx.y * (*g_block_num) + blockIdx.x] = 1;
    }
}