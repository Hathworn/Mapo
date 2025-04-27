#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_SM_block(volatile unsigned int *frontier, volatile unsigned int *frontier2,
                                    unsigned int frontier_len, volatile unsigned int *cost,
                                    volatile int *visited, unsigned int *edgeArray,
                                    unsigned int *edgeArrayAux, unsigned int numVertices,
                                    unsigned int numEdges, volatile unsigned int *frontier_length,
                                    unsigned int num_p_per_mp, unsigned int w_q_size) {
    // Calculate the global thread index
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Handle out-of-bounds threads
    if (tid >= frontier_len) return;

    // Fetch the vertex from the frontier
    unsigned int vertex = frontier[tid];

    // Iterate over all outgoing edges of the vertex
    for (unsigned int edge = edgeArrayAux[vertex]; edge < edgeArrayAux[vertex + 1]; edge++) {
        unsigned int neighbor = edgeArray[edge];

        // Proceed if the neighbor hasn't been visited
        if (atomicExch(&visited[neighbor], 1) == 0) {
            // Update the cost and add the neighbor to the new frontier
            cost[neighbor] = cost[vertex] + 1;
            unsigned int idx = atomicAdd(frontier_length, 1);
            
            // Ensure the new index is within bounds
            if (idx < w_q_size) {
                frontier2[idx] = neighbor;
            }
        }
    }
}