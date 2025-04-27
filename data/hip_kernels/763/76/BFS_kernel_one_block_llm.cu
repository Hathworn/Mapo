#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block(volatile unsigned int *frontier, unsigned int frontier_len, 
                                     volatile unsigned int *cost, volatile int *visited, 
                                     unsigned int *edgeArray, unsigned int *edgeArrayAux, 
                                     unsigned int numVertices, unsigned int numEdges, 
                                     volatile unsigned int *frontier_length, unsigned int num_p_per_mp, 
                                     unsigned int w_q_size) {
    // Calculate the thread ID within the block
    unsigned int thread_id = threadIdx.x;

    // Iterate through the frontier
    for (unsigned int i = thread_id; i < frontier_len; i += blockDim.x) {
        unsigned int vertex = frontier[i];

        // Only proceed if the vertex has not been visited
        if (!visited[vertex]) {
            visited[vertex] = 1;  // Mark as visited

            // Examine the edges of the current vertex
            unsigned int start_edge = edgeArray[vertex];
            unsigned int end_edge = edgeArray[vertex + 1];

            for (unsigned int j = start_edge; j < end_edge; j++) {
                unsigned int neighbor = edgeArrayAux[j];

                // Atomic operation to avoid race conditions
                if (atomicMin(&cost[neighbor], cost[vertex] + 1) > cost[vertex] + 1) {
                    // Add neighbor to the frontier
                    unsigned int index = atomicAdd(frontier_length, 1);

                    if (index < w_q_size) {  // Ensure the frontier size does not exceed the max
                        frontier[index] = neighbor;
                    }
                }
            }
        }
    }
}