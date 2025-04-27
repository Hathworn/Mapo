#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_relabel_atomic(int *g_left_weight, int *g_right_weight, int *g_down_weight, int *g_up_weight, int *g_sink_weight, int *g_push_reser, int *g_pull_left, int *g_pull_right, int *g_pull_down, int *g_pull_up, int *g_relabel_mask, int *g_graph_height, int *g_height_write, int graph_size, int width, int rows, int graph_size1, int width1, int rows1) {
    int x1 = threadIdx.x;
    int y1 = threadIdx.y;
    int x = blockIdx.x * blockDim.x + x1;
    int y = blockIdx.y * blockDim.y + y1;
    int thid = y * width1 + x;

    __shared__ int height_fn[356];
    
    int temp_mult = (y1 + 1) * 34 + x1 + 1;
    height_fn[temp_mult] = g_graph_height[thid];
    
    // Load border heights into shared memory for the halo region
    if (threadIdx.x == 31 && x < width1 - 1) height_fn[temp_mult + 1] = g_graph_height[thid + 1];
    if (threadIdx.x == 0 && x > 0) height_fn[temp_mult - 1] = g_graph_height[thid - 1];
    if (threadIdx.y == 7 && y < rows1 - 1) height_fn[temp_mult + 34] = g_graph_height[thid + width1];
    if (threadIdx.y == 0 && y > 0) height_fn[temp_mult - 34] = g_graph_height[thid - width1];
    
    __syncthreads();

    int flow_push = g_push_reser[thid];
    int current_height = height_fn[temp_mult];

    // Compute relabel mask
    if (flow_push <= 0 || (g_left_weight[thid] == 0 && g_right_weight[thid] == 0 && g_down_weight[thid] == 0 && g_up_weight[thid] == 0 && g_sink_weight[thid] == 0)) {
        g_relabel_mask[thid] = 2;
    } else {
        bool condition = (current_height == height_fn[temp_mult - 1] + 1 && g_left_weight[thid] > 0) ||
                         (current_height == height_fn[temp_mult + 1] + 1 && g_right_weight[thid] > 0) ||
                         (current_height == height_fn[temp_mult + 34] + 1 && g_down_weight[thid] > 0) ||
                         (current_height == height_fn[temp_mult - 34] + 1 && g_up_weight[thid] > 0) ||
                         (current_height == 1 && g_sink_weight[thid] > 0);
        g_relabel_mask[thid] = condition ? 1 : 0;
    }

    __syncthreads();

    // Update height if within valid region
    if (thid < graph_size1 && x < width - 1 && x > 0 && y < rows - 1 && y > 0) {
        if (g_sink_weight[thid] > 0) {
            g_height_write[thid] = 1;
        } else {
            int min_height = graph_size;
            int h_left = height_fn[temp_mult - 1];
            int h_right = height_fn[temp_mult + 1];
            int h_down = height_fn[temp_mult + 34];
            int h_up = height_fn[temp_mult - 34];

            if (g_left_weight[thid] > 0) min_height = min(min_height, h_left);
            if (g_right_weight[thid] > 0) min_height = min(min_height, h_right);
            if (g_down_weight[thid] > 0) min_height = min(min_height, h_down);
            if (g_up_weight[thid] > 0) min_height = min(min_height, h_up);

            g_height_write[thid] = min_height + 1;
        }
    }
}