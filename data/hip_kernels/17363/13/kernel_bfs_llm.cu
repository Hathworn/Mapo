#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_bfs(int *g_left_weight, int *g_right_weight, int *g_down_weight, int *g_up_weight, int *g_graph_height, bool *g_pixel_mask, int vertex_num, int width, int height, int vertex_num1, int width1, int height1, bool *g_over, int *g_counter)
{
// Calculate thread ID
int thid = blockIdx.x * blockDim.x + threadIdx.x;

// Condition to ensure threads are within bounds and pixel mask is true
if (thid < vertex_num && g_pixel_mask[thid])
{
    int col = thid % width1, row = thid / width1;

    // Avoid boundary edges for optimization
    if (col > 0 && col < width - 1 && row > 0 && row < height - 1)
    {
        int height_r = g_graph_height[thid + 1];
        int height_l = g_graph_height[thid - 1];
        int height_d = g_graph_height[thid + width1];
        int height_u = g_graph_height[thid - width1];

        // Combine conditions for better warp efficiency
        if ((height_l == (*g_counter) && g_right_weight[thid - 1] > 0) ||
            (height_d == (*g_counter) && g_up_weight[thid + width1] > 0) ||
            (height_r == (*g_counter) && g_left_weight[thid + 1] > 0) ||
            (height_u == (*g_counter) && g_down_weight[thid - width1] > 0))
        {
            g_graph_height[thid] = (*g_counter) + 1;
            g_pixel_mask[thid] = false;
            *g_over = true;
        }
    }
}
}