#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Kernel2(bool *g_graph_mask, bool *g_updating_graph_mask, bool *g_graph_visited, bool *g_over, int no_of_nodes) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Early exit if tid is out of bounds
    if (tid >= no_of_nodes) return;
    
    // Check the condition to minimize divergent branches
    if (g_updating_graph_mask[tid]) {
        g_graph_mask[tid] = true;
        g_graph_visited[tid] = true;
        *g_over = true;
        g_updating_graph_mask[tid] = false;
    }
}