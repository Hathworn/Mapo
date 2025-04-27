#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_push2_atomic(int *g_left_weight, int *g_right_weight, int *g_down_weight, int *g_up_weight, int *g_sink_weight, int *g_push_reser, int *g_pull_left, int *g_pull_right, int *g_pull_down, int *g_pull_up, int *g_relabel_mask, int *g_graph_height, int *g_height_write, int graph_size, int width, int rows, int graph_size1, int width1, int rows1)
{
    int x1 = threadIdx.x;
    int y1 = threadIdx.y;
    int x = blockIdx.x * blockDim.x + x1;
    int y = blockIdx.y * blockDim.y + y1;
    int thid = y * width1 + x;

    __shared__ int height_fn[356];

    int temp_mult = (y1 + 1) * 34 + x1 + 1, temp_mult1 = y1 * 32 + x1;

    height_fn[temp_mult] = g_graph_height[thid];

    if (x < width1 - 1)
        height_fn[temp_mult + 1] = (g_graph_height[thid + 1]);
    if (x > 0)
        height_fn[temp_mult - 1] = (g_graph_height[thid - 1]);
    if (y < rows1 - 1)
        height_fn[temp_mult + 34] = (g_graph_height[thid + width1]);
    if (y > 0)
        height_fn[temp_mult - 34] = (g_graph_height[thid - width1]);

    __syncthreads();

    int flow_push = g_push_reser[thid];
    int min_flow_pushed = flow_push;

    if (thid < graph_size1 && g_relabel_mask[thid] == 1 && x < width - 1 && x > 0 && y < rows - 1 && y > 0)
    {
        int temp_weight = g_sink_weight[thid];
        if (temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == 1)
        {
            if (temp_weight < flow_push) min_flow_pushed = temp_weight;
            g_sink_weight[thid] = temp_weight - min_flow_pushed;
            atomicSub(&g_push_reser[thid], min_flow_pushed);
        }

        for (int dir = 0; dir < 4; dir++)
        {
            int *weight, *opp_weight, offset;
            switch (dir) {
                case 0: weight = g_left_weight; opp_weight = g_right_weight; offset = -1; break;
                case 1: weight = g_up_weight; opp_weight = g_down_weight; offset = -width1; break;
                case 2: weight = g_right_weight; opp_weight = g_left_weight; offset = 1; break;
                default: weight = g_down_weight; opp_weight = g_up_weight; offset = width1; break;
            }
            temp_weight = weight[thid];
            if (temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == height_fn[temp_mult + offset] + 1)
            {
                if (temp_weight < flow_push) min_flow_pushed = temp_weight;
                atomicSub(&weight[thid], min_flow_pushed);
                atomicAdd(&opp_weight[thid + offset], min_flow_pushed);
                atomicSub(&g_push_reser[thid], min_flow_pushed);
                atomicAdd(&g_push_reser[thid + offset], min_flow_pushed);
            }
            else if (dir == 0) atomicSub(&g_pull_left[thid + offset], 1);
            else if (dir == 1) atomicSub(&g_pull_up[thid + offset], 1);
            else if (dir == 2) atomicSub(&g_pull_right[thid + offset], 1);
            else atomicSub(&g_pull_down[thid + offset], 1);
        }
    }

    __syncthreads();

    min_flow_pushed = g_left_weight[thid];

    if (flow_push <= 0 || (g_left_weight[thid] == 0 && g_right_weight[thid] == 0 && g_down_weight[thid] == 0 && g_up_weight[thid] == 0 && g_sink_weight[thid] == 0))
        g_relabel_mask[thid] = 2;
    else
    {
        if (flow_push > 0 && ((height_fn[temp_mult] == height_fn[temp_mult - 1] + 1 && g_left_weight[thid] > 0) || 
                              (height_fn[temp_mult] == height_fn[temp_mult + 1] + 1 && g_right_weight[thid] > 0) || 
                              (height_fn[temp_mult] == height_fn[temp_mult + 34] + 1 && g_down_weight[thid] > 0) || 
                              (height_fn[temp_mult] == height_fn[temp_mult - 34] + 1 && g_up_weight[thid] > 0) || 
                              (height_fn[temp_mult] == 1 && g_sink_weight[thid] > 0))) 
            g_relabel_mask[thid] = 1;
        else 
            g_relabel_mask[thid] = 0;
    }

    __syncthreads();

    if (thid < graph_size1 && g_relabel_mask[thid] == 1 && x < width - 1 && x > 0 && y < rows - 1 && y > 0)
    {
        int temp_weight = g_sink_weight[thid];
        if (temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == 1)
        {
            if (temp_weight < flow_push) min_flow_pushed = temp_weight;
            g_sink_weight[thid] = temp_weight - min_flow_pushed;
            atomicSub(&g_push_reser[thid], min_flow_pushed);
        }

        for (int dir = 0; dir < 4; dir++)
        {
            int *weight, *opp_weight, offset;
            switch (dir) {
                case 0: weight = g_left_weight; opp_weight = g_right_weight; offset = -1; break;
                case 1: weight = g_up_weight; opp_weight = g_down_weight; offset = -width1; break;
                case 2: weight = g_right_weight; opp_weight = g_left_weight; offset = 1; break;
                default: weight = g_down_weight; opp_weight = g_up_weight; offset = width1; break;
            }
            temp_weight = weight[thid];
            if (temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == height_fn[temp_mult + offset] + 1)
            {
                if (temp_weight < flow_push) min_flow_pushed = temp_weight;
                atomicSub(&weight[thid], min_flow_pushed);
                atomicAdd(&opp_weight[thid + offset], min_flow_pushed);
                atomicSub(&g_push_reser[thid], min_flow_pushed);
                atomicAdd(&g_push_reser[thid + offset], min_flow_pushed);
            }
            else if (dir == 0) atomicSub(&g_pull_left[thid + offset], 1);
            else if (dir == 1) atomicSub(&g_pull_up[thid + offset], 1);
            else if (dir == 2) atomicSub(&g_pull_right[thid + offset], 1);
            else atomicSub(&g_pull_down[thid + offset], 1);
        }
    }
}