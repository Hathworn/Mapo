#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block(volatile unsigned int *frontier, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, unsigned int num_p_per_mp, unsigned int w_q_size) {
    // Calculate global thread index
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within valid range
    if (tid < frontier_len) {
        unsigned int node = frontier[tid];
        unsigned int start_edge = edgeArray[node];
        unsigned int end_edge = (node + 1 < numVertices) ? edgeArray[node + 1] : numEdges;
        
        // Iterate over edges of the current node
        for (unsigned int edge = start_edge; edge < end_edge; ++edge) {
            unsigned int neighbor = edgeArrayAux[edge];
            
            // Check and update cost if not yet visited
            if (!visited[neighbor]) {
                cost[neighbor] = cost[node] + 1;
                visited[neighbor] = 1;
                
                // Atomic operation to update frontier length
                atomicAdd((unsigned int*)frontier_length, 1);
            }
        }
    }
}