#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_push2_stochastic(int *g_left_weight, int *g_right_weight, int *g_down_weight, int *g_up_weight, int *g_sink_weight, int *g_push_reser, int *g_pull_left, int *g_pull_right, int *g_pull_down, int *g_pull_up, int *g_relabel_mask, int *g_graph_height, int *g_height_write, int graph_size, int width, int rows, int graph_size1, int width1, int rows1, int *d_relabel, int *d_stochastic, int *d_counter, bool *d_finish, int *g_block_num)
{
    if(d_stochastic[blockIdx.y * (*g_block_num) + blockIdx.x] == 1) 
    {
        int x1 = threadIdx.x;
        int y1 = threadIdx.y;
        int x  = __umul24(blockIdx.x, blockDim.x) + threadIdx.x;
        int y  = __umul24(blockIdx.y, blockDim.y) + threadIdx.y;
        int thid = __umul24(y, width1) + x;

        __shared__ int height_fn[356];

        int temp_mult = __umul24(y1+1, 34) + x1 + 1, temp_mult1 = __umul24(y1, 32) + x1;

        // Load heights into shared memory
        height_fn[temp_mult] = g_graph_height[thid];
        if (threadIdx.x == 31 && x < width1 - 1) height_fn[temp_mult + 1] = g_graph_height[thid + 1];
        if (threadIdx.x == 0 && x > 0) height_fn[temp_mult - 1] = g_graph_height[thid - 1];
        if (threadIdx.y == 7 && y < rows1 - 1) height_fn[temp_mult + 34] = g_graph_height[thid + width1];
        if (threadIdx.y == 0 && y > 0) height_fn[temp_mult - 34] = g_graph_height[thid - width1];

        __syncthreads();

        int flow_push = g_push_reser[thid], min_flow_pushed = 0;

        // Optimized logic block
        if(thid < graph_size1 && g_relabel_mask[thid] == 1 && x < width-1 && x > 0 && y < rows-1 && y > 0)
        {
            int temp_weight = g_sink_weight[thid];
            min_flow_pushed = flow_push;

            // Sink weight calculations
            if(temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == 1)
            {
                min_flow_pushed = min(temp_weight, flow_push);
                g_sink_weight[thid] -= min_flow_pushed;
                atomicSub(&g_push_reser[thid], min_flow_pushed);
            }

            // Left weight calculations
            flow_push = g_push_reser[thid];
            min_flow_pushed = flow_push;
            temp_weight = g_left_weight[thid];

            if(temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == height_fn[temp_mult - 1] + 1)
            {
                min_flow_pushed = min(temp_weight, flow_push);
                atomicSub(&g_left_weight[thid], min_flow_pushed);
                atomicAdd(&g_right_weight[thid-1], min_flow_pushed);
                atomicSub(&g_push_reser[thid], min_flow_pushed);
                atomicAdd(&g_push_reser[thid-1], min_flow_pushed);
            }
            else atomicSub(&g_pull_left[thid-1], 1);

            // Up weight calculations
            flow_push = g_push_reser[thid];
            min_flow_pushed = flow_push;
            temp_weight = g_up_weight[thid];

            if(temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == height_fn[temp_mult - 34] + 1)
            {
                min_flow_pushed = min(temp_weight, flow_push);
                atomicSub(&g_up_weight[thid], min_flow_pushed);
                atomicAdd(&g_down_weight[thid-width1],min_flow_pushed);
                atomicSub(&g_push_reser[thid], min_flow_pushed);
                atomicAdd(&g_push_reser[thid-width1], min_flow_pushed);
            }
            else atomicSub(&g_pull_up[thid - width1], 1);

            // Right weight calculations
            flow_push = g_push_reser[thid];
            min_flow_pushed = flow_push;
            temp_weight = g_right_weight[thid];

            if(temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == height_fn[temp_mult + 1] + 1)
            {
                min_flow_pushed = min(temp_weight, flow_push);
                atomicSub(&g_right_weight[thid], min_flow_pushed);
                atomicAdd(&g_left_weight[thid+1], min_flow_pushed);
                atomicSub(&g_push_reser[thid], min_flow_pushed);
                atomicAdd(&g_push_reser[thid+1], min_flow_pushed);
            }
            else atomicSub(&g_pull_right[thid + 1], 1);

            // Down weight calculations
            flow_push = g_push_reser[thid];
            min_flow_pushed = flow_push;
            temp_weight = g_down_weight[thid];

            if(temp_weight > 0 && flow_push > 0 && height_fn[temp_mult] == height_fn[temp_mult + 34] + 1)
            {
                min_flow_pushed = min(temp_weight, flow_push);
                atomicSub(&g_down_weight[thid], min_flow_pushed);
                atomicAdd(&g_up_weight[thid+width1], min_flow_pushed);
                atomicSub(&g_push_reser[thid], min_flow_pushed);
                atomicAdd(&g_push_reser[thid+width1], min_flow_pushed);
            }
            else atomicSub(&g_pull_down[thid+width1], 1);
        }

        __syncthreads();

        // Relabel logic
        min_flow_pushed = g_left_weight[thid];
        flow_push = g_push_reser[thid];

        if (flow_push <= 0 || (g_left_weight[thid] == 0 && g_right_weight[thid] == 0 && g_down_weight[thid] == 0 && g_up_weight[thid] == 0 && g_sink_weight[thid] == 0))
            g_relabel_mask[thid] = 2;
        else
            g_relabel_mask[thid] = (flow_push > 0 && (height_fn[temp_mult] == height_fn[temp_mult-1] + 1 && g_left_weight[thid] > 0 || height_fn[temp_mult] == height_fn[temp_mult+1] + 1 && g_right_weight[thid] > 0 || height_fn[temp_mult] == height_fn[temp_mult+34] + 1 && g_down_weight[thid] > 0 || height_fn[temp_mult] == height_fn[temp_mult-34] + 1 && g_up_weight[thid] > 0 || height_fn[temp_mult] == 1 && g_sink_weight[thid] > 0)) ? 1 : 0;

        __syncthreads();
    }
}