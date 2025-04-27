#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_SM_block(volatile unsigned int *frontier, volatile unsigned int *frontier2, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, unsigned int num_p_per_mp, unsigned int w_q_size) {
    // Calculate thread index within the block
    unsigned int tid = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure the thread does not exceed the number of vertices
    if (tid < frontier_len) {
        // Each thread works on a node from the frontier
        unsigned int node = frontier[tid];
        unsigned int start = edgeArray[node];
        unsigned int end = (node == numVertices - 1) ? numEdges : edgeArray[node + 1];
        
        // Explore neighbors of the node
        for (unsigned int edge = start; edge < end; ++edge) {
            unsigned int neighbor = edgeArrayAux[edge];
            
            // Check and set visited status for the neighbor
            if (atomicExch(&visited[neighbor], 1) == 0) {
                cost[neighbor] = cost[node] + 1;
                    
                // Append to the new frontier using atomic operation
                unsigned int index = atomicAdd((unsigned int*)frontier_length, 1);
                frontier2[index] = neighbor;
            }
        }
    }
}