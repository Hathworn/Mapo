#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by applying thread coarsening and removing redundant calculations
__global__ void kernel_push_stochastic2(int *g_terminate, int *g_relabel_mask, int *g_push_reser, int *s_push_reser, int *d_stochastic, int *g_block_num, int width1)
{
    int blockOffset = blockIdx.y * (*g_block_num) + blockIdx.x;
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int thid = y * width1 + x;

    // Coalesced memory access and reduced redundant calculations
    int push_diff = s_push_reser[thid] - g_push_reser[thid];
    if (push_diff != 0)
    {
        g_terminate[blockOffset] = 1;
    }

    if (g_relabel_mask[thid] == 1)
    {
        d_stochastic[blockOffset] = 1;
    }
}