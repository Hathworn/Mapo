#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_SM_block(volatile unsigned int *frontier, volatile unsigned int *frontier2, unsigned int frontier_len, 
                                    volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, 
                                    unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, 
                                    volatile unsigned int *frontier_length, unsigned int num_p_per_mp, unsigned int w_q_size) 
{
    // Calculate global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check thread ID within frontier length for bounds safety
    if (tid < frontier_len) {
        unsigned int vertex = frontier[tid];

        // Iterate over adjacent vertices
        for (unsigned int i = edgeArrayAux[vertex]; i < edgeArrayAux[vertex + 1]; ++i) {
            unsigned int neighbor = edgeArray[i];

            // Atomic operation ensures correct updating of shared data (visited)
            if (atomicExch(&visited[neighbor], 1) == 0) {
                // Update with appropriate BFS tree cost
                cost[neighbor] = cost[vertex] + 1;

                // Determine position in frontier2, increment frontier_length atomically
                unsigned int pos = atomicAdd((unsigned int*)frontier_length, 1);

                // Assign vertex to frontier2 at calculated position
                frontier2[pos] = neighbor;
            }
        }
    }
}