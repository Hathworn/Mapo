#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_bfs(int *g_left_weight, int *g_right_weight, int *g_down_weight, int *g_up_weight, int *g_graph_height, bool *g_pixel_mask, int vertex_num, int width, int height, int vertex_num1, int width1, int height1, bool *g_over, int *g_counter)
{
    // Calculate thread index
    int thid = blockIdx.x * blockDim.x + threadIdx.x;

    if (thid < vertex_num && g_pixel_mask[thid])
    {
        int col = thid % width1, row = thid / width1;

        // Check for boundary conditions
        if (col < width - 1 && col > 0 && row < height - 1 && row > 0)
        {
            // Load neighboring heights
            int height_l = g_graph_height[thid - 1];
            int height_r = g_graph_height[thid + 1];
            int height_d = g_graph_height[thid + width1];
            int height_u = g_graph_height[thid - width1];

            int counter_val = *g_counter;

            // Check BFS condition and update graph height
            if ((height_l == counter_val && g_right_weight[thid - 1] > 0) || 
                (height_d == counter_val && g_up_weight[thid + width1] > 0) || 
                (height_r == counter_val && g_left_weight[thid + 1] > 0) || 
                (height_u == counter_val && g_down_weight[thid - width1] > 0))
            {
                g_graph_height[thid] = counter_val + 1;
                g_pixel_mask[thid] = false;
                *g_over = true;
            }
        }
    }
}