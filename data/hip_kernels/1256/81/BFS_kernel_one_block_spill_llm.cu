#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block_spill(volatile unsigned int *frontier, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, const unsigned int max_mem) {
    // Calculate thread and block indices
    unsigned int tid = threadIdx.x;
    unsigned int index = blockIdx.x * blockDim.x + tid;

    // Ensure memory access is within bounds
    if (index < frontier_len) {
        unsigned int node = frontier[index];
        
        // Load node and its properties from global memory to registers
        unsigned int start = edgeArray[node];
        unsigned int end = edgeArray[node + 1];
        
        // Iterate over neighbors
        for (unsigned int edge = start; edge < end; ++edge) {
            unsigned int neighbor = edgeArrayAux[edge];
            
            // Check and update visited status
            if (atomicCAS((int*)&visited[neighbor], 0, 1) == 0) {
                cost[neighbor] = cost[node] + 1; // Update cost
                unsigned int pos = atomicAdd((unsigned int*)frontier_length, 1);
                
                // Ensure the new frontier fits within max memory and update
                if (pos < max_mem) {
                    frontier[pos] = neighbor;
                }
            }
        }
    }
}