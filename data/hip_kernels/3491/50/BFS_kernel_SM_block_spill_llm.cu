#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_SM_block_spill(volatile unsigned int *frontier, 
                                          volatile unsigned int *frontier2, 
                                          unsigned int frontier_len, 
                                          volatile unsigned int *cost, 
                                          volatile int *visited, 
                                          unsigned int *edgeArray, 
                                          unsigned int *edgeArrayAux, 
                                          unsigned int numVertices, 
                                          unsigned int numEdges, 
                                          volatile unsigned int *frontier_length, 
                                          const unsigned int max_mem) {
    // Calculate thread and block index
    unsigned int tid = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Process each frontier in stride of available threads
    for (unsigned int index = tid; index < frontier_len; index += stride) {
        unsigned int node = frontier[index];

        // If node was not visited
        if (!visited[node]) {
            visited[node] = 1; // Mark as visited

            // Iterate over all edges of the node
            unsigned int start = edgeArray[node];
            unsigned int end = (node + 1 < numVertices) ? edgeArray[node + 1] : numEdges;

            // Loop through edges
            for (unsigned int j = start; j < end; ++j) {
                unsigned int neighbor = edgeArrayAux[j];

                // If neighbor wasn't visited, update cost and add to frontier2
                if (!visited[neighbor]) {
                    cost[neighbor] = cost[node] + 1;
                    unsigned int old_len = atomicAdd(frontier_length, 1);
                    if (old_len < max_mem) {
                        frontier2[old_len] = neighbor;
                    }
                }
            }
        }
    }
}