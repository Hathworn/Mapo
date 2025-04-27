#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_SM_block_spill(volatile unsigned int *frontier, volatile unsigned int *frontier2, unsigned int frontier_len, volatile unsigned int *cost, 
    volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, 
    volatile unsigned int *frontier_length, const unsigned int max_mem) {
    
    // Calculate the global thread index
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid >= frontier_len) return; // Ensure we only process valid frontier elements

    // Load frontier element into a register for faster access
    unsigned int currentVertex = frontier[tid];

    // Process edges of the current vertex
    unsigned int startEdge = edgeArrayAux[currentVertex];
    unsigned int endEdge = edgeArrayAux[currentVertex + 1];

    // Iterate over neighbors
    for (unsigned int edge = startEdge; edge < endEdge; ++edge) {
        unsigned int neighbor = edgeArray[edge];
        
        // Check if the neighbor has been visited
        if (visited[neighbor] == 0) {
            // Mark neighbor as visited
            visited[neighbor] = 1;

            // Update cost for the neighbor
            cost[neighbor] = cost[currentVertex] + 1;

            // Add neighbor to the new frontier if within memory limits
            unsigned int index = atomicAdd((unsigned int *)frontier_length, 1);
            if (index < max_mem) {
                frontier2[index] = neighbor;
            }
        }
    }
}