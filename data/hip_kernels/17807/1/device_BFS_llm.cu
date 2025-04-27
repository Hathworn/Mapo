#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_BFS(const int* edges, const int* dests, int* labels, int* visited, int* c_frontier_tail, int* c_frontier, int* p_frontier_tail, int* p_frontier) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index within bounds
    if (index < *p_frontier_tail) {
        int c_vertex = p_frontier[index];
        
        // Preload vertex edges information to avoid recalculating it
        int start_edge = edges[c_vertex];
        int end_edge = edges[c_vertex + 1];

        // Loop through edges more efficiently
        for (int i = start_edge; i < end_edge; i++) {
            int destination_vertex = dests[i];
            
            // Use atomic operation efficiently
            if (atomicExch(visited + destination_vertex, 1) == 0) {
                int old_tail = atomicAdd(c_frontier_tail, 1);
                
                // Efficient memory access
                c_frontier[old_tail] = destination_vertex;
                labels[destination_vertex] = labels[c_vertex] + 1;
            }
        }
    }
}