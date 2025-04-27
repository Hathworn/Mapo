#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_SM_block_spill(volatile unsigned int *frontier, volatile unsigned int *frontier2, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, const unsigned int max_mem) {
    // Calculate the global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within the frontier length
    if (tid < frontier_len) {
        unsigned int vertex = frontier[tid];
        
        // Iterate through edges connected to the vertex
        unsigned int startEdge = edgeArray[vertex];
        unsigned int endEdge = (vertex + 1 < numVertices) ? edgeArray[vertex + 1] : numEdges;
        
        for (unsigned int edge = startEdge; edge < endEdge; ++edge) {
            unsigned int neighbor = edgeArrayAux[edge];
            
            // If the neighbor has not been visited, mark it visited
            if (atomicExch(&visited[neighbor], 1) == 0) {
                cost[neighbor] = cost[vertex] + 1; // Update cost
                unsigned int index = atomicAdd(frontier_length, 1); // Update new frontier length
                
                // Check if we have enough memory
                if (index < max_mem) {
                    frontier2[index] = neighbor; // Add neighbor to new frontier
                }
            }
        }
    }
}