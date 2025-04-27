#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block(volatile unsigned int *frontier, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, unsigned int num_p_per_mp, unsigned int w_q_size) {
    // Calculate thread index
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure thread index is within frontier length
    if (idx < frontier_len) {

        // Load frontier data to register (coalesced memory access)
        unsigned int vertex = frontier[idx];

        // Process only unvisited vertices
        if (visited[vertex] == 0) {

            // Iterate over neighbors
            unsigned int start_edge = edgeArrayAux[vertex];
            unsigned int end_edge = edgeArrayAux[vertex + 1];
            
            for (unsigned int edge = start_edge; edge < end_edge; ++edge) {
                unsigned int neighbor = edgeArray[edge];
                
                // Update cost and mark as visited
                if (atomicMin(&cost[neighbor], cost[vertex] + 1)) {
                    atomicExch(&visited[neighbor], 1);
                }
            }
        }

        // Update frontier length atomically (to avoid race conditions)
        if (visited[vertex] == 1) {
            atomicAdd(frontier_length, 1);
        }
    }
}