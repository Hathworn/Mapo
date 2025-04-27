#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_SM_block_spill(volatile unsigned int *frontier, volatile unsigned int *frontier2, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, const unsigned int max_mem) {
    // Calculate the global thread index
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;  
    
    // Iterate over all vertices in the current frontier
    for (unsigned int i = tid; i < frontier_len; i += blockDim.x * gridDim.x) {
        unsigned int vertex = frontier[i];
        // Iterate over all neighbors of the current vertex
        for (unsigned int edgeIdx = edgeArray[vertex]; edgeIdx < edgeArray[vertex + 1]; ++edgeIdx) {
            unsigned int neighbour = edgeArrayAux[edgeIdx];
            // If the neighbor has not been visited
            if (atomicExch((int*)&visited[neighbour], 1) == 0) { 
                // Update cost
                cost[neighbour] = cost[vertex] + 1;
                // Add neighbour to the new frontier
                unsigned int idx = atomicAdd(frontier_length, 1);
                frontier2[idx] = neighbour;
            }
        }
    }
}