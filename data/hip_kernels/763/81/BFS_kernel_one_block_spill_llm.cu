#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block_spill(volatile unsigned int *frontier, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, const unsigned int max_mem) {
    extern __shared__ unsigned int shared_memory[]; // Use shared memory

    unsigned int *local_frontier = shared_memory;
    unsigned int tid = threadIdx.x;

    for (int i = tid; i < frontier_len; i += blockDim.x) {
        unsigned int node = frontier[i];
        
        unsigned int start = edgeArray[node];
        unsigned int end = edgeArray[node + 1];

        for (unsigned int edge = start; edge < end; ++edge) {
            unsigned int neighbor = edgeArrayAux[edge];
            
            if (!visited[neighbor]) {
                visited[neighbor] = 1;
                cost[neighbor] = cost[node] + 1;
                unsigned int index = atomicAdd(frontier_length, 1);
                
                if (index < max_mem) {
                    local_frontier[index] = neighbor; // Add to local frontier
                }
            }
        }
    }

    __syncthreads(); // Synchronize threads before writing back to global memory

    for (int i = tid; i < *frontier_length; i += blockDim.x) {
        if (i < max_mem) {
            frontier[i] = local_frontier[i]; // Write back to global memory
        }
    }
}