#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void BFS_kernel_SM_block(volatile unsigned int *frontier, volatile unsigned int *frontier2, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, unsigned int num_p_per_mp, unsigned int w_q_size) {
    // Calculate global thread ID for unique indexing
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Process nodes in the frontier
    if (tid < frontier_len) {
        unsigned int node = frontier[tid];

        // Access edge array to traverse adjacency list
        for (unsigned int edge_idx = edgeArrayAux[node]; edge_idx < edgeArrayAux[node + 1]; edge_idx++) {
            unsigned int neighbor = edgeArray[edge_idx]; // Get neighbor

            // Atomic operation to ensure only the first thread updates visited
            int was_visited = atomicExch(&visited[neighbor], 1);

            if (!was_visited) { // If the neighbor was not visited before
                cost[neighbor] = cost[node] + 1;  // Update cost
                unsigned int pos = atomicAdd(frontier_length, 1);  // Reserve position in frontier2
                frontier2[pos] = neighbor;  // Add new frontier node
            }
        }
    }
}