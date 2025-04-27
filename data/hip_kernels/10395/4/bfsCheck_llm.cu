#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bfsCheck(bool *d_graph_mask, bool *d_updating_graph_mask, bool *d_graph_visited, int no_of_nodes, bool *stop)
{
    __shared__ bool local_stop; // Use shared memory for stop flag
    if (threadIdx.x == 0) local_stop = false; // Initialize shared stop flag
    __syncthreads();

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < no_of_nodes) {
        if (d_updating_graph_mask[tid]) {
            d_graph_mask[tid] = true;
            d_graph_visited[tid] = true;
            local_stop = true; // Set shared stop flag
            d_updating_graph_mask[tid] = false;
        }
    }
    __syncthreads();
    if (threadIdx.x == 0 && local_stop) *stop = true; // Update global stop flag
}