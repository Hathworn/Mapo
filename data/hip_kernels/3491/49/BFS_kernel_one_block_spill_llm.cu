#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block_spill(volatile unsigned int *frontier, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, const unsigned int max_mem) {
    // Calculate the unique thread index
    unsigned int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure tid does not exceed frontier length
    if (tid < frontier_len) {
        unsigned int vertex = frontier[tid];
        
        // Traverse edges for the current vertex
        unsigned int start_edge = edgeArrayAux[vertex];
        unsigned int end_edge = edgeArrayAux[vertex + 1];

        for (unsigned int edge = start_edge; edge < end_edge; ++edge) {
            unsigned int neighbor = edgeArray[edge];

            // Check if neighbor has been visited
            if (!visited[neighbor]) {
                visited[neighbor] = 1;
                cost[neighbor] = cost[vertex] + 1;

                // Atomically add the neighbor vertex to the frontier
                unsigned int index = atomicAdd(frontier_length, 1);
                
                // Ensure memory safety with max_mem check
                if (index < max_mem) {
                    frontier[index] = neighbor;
                }
            }
        }
    }
}