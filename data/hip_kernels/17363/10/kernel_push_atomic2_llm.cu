#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_push_atomic2(int *g_terminate, int *g_push_reser, int *s_push_reser, int *g_block_num, int width1)
{
    // Improve thread indexing by using grid-stride loops
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    int blocks_in_grid = gridDim.x * gridDim.y;

    for (int i = index; i < width1 * blocks_in_grid; i += stride)
    {
        if (s_push_reser[i] - g_push_reser[i] != 0)
        {
            // Calculate 2D block position and set termination flag
            int bx = i % width1;
            int by = (i / width1) / width1;
            g_terminate[by * (*g_block_num) + bx] = 1;
        }
    }
}