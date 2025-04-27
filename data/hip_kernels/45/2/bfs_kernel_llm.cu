#include "hip/hip_runtime.h"
#include "includes.h"
#ifndef _KERNEL_H
#define _KERNEL_H
typedef struct Node {
int starting;
int no_of_edges;
}Node;

#endif

__global__ void bfs_kernel(Node* d_graph_nodes, int* d_edge_list, bool* d_graph_level, bool* d_graph_visited, int* d_cost, bool* loop, int no_of_nodes) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if thread index is out of bounds
    if (tid >= no_of_nodes) return;

    // Check if the vertex is in the current level and needs to be visited
    if (d_graph_level[tid]) {
        d_graph_level[tid] = false;
        d_graph_visited[tid] = true;

        // Cache graph node data in local variables for memory access optimization
        int start = d_graph_nodes[tid].starting;
        int end = start + d_graph_nodes[tid].no_of_edges;

        for (int i = start; i < end; i++) {
            int id = d_edge_list[i];

            // Check if the node is already visited
            if (!d_graph_visited[id]) {
                // Update cost and set the vertex to be visited in the next level
                d_cost[id] = d_cost[tid] + 1;
                d_graph_level[id] = true;

                // Signal that another iteration is needed
                *loop = true;
            }
        }
    }
}