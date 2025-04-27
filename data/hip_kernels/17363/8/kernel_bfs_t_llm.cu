#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_bfs_t(int *g_push_reser, int *g_sink_weight, int *g_graph_height, bool *g_pixel_mask, int vertex_num, int width, int height, int vertex_num1, int width1, int height1)
{
    int thid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within range and pixel is not masked
    if (thid < vertex_num && g_pixel_mask[thid])
    {
        int col = thid % width1;
        int row = thid / width1;

        // Check conditions for setting height or unmasking pixels
        if (col > 0 && row > 0 && col < width - 1 && row < height - 1 && g_push_reser[thid] > 0)
        {
            g_graph_height[thid] = 1;
            g_pixel_mask[thid] = false;
        }
        else if (g_sink_weight[thid] > 0)
        {
            g_graph_height[thid] = -1;
            g_pixel_mask[thid] = false;
        }
    }
}