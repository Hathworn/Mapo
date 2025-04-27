#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block(volatile unsigned int *frontier, unsigned int frontier_len, 
                                     volatile unsigned int *cost, volatile int *visited, 
                                     unsigned int *edgeArray, unsigned int *edgeArrayAux, 
                                     unsigned int numVertices, unsigned int numEdges, 
                                     volatile unsigned int *frontier_length, unsigned int num_p_per_mp, 
                                     unsigned int w_q_size) {
    // Calculate global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if thread ID exceeds frontier length
    if (tid >= frontier_len) {
        return;
    }

    // Load data into shared memory for faster access
    __shared__ unsigned int local_frontier[256];
    local_frontier[threadIdx.x] = frontier[tid];
    __syncthreads();  // Ensure all threads have loaded data into shared memory

    // Process edges
    for (unsigned int i = 0; i < numEdges; ++i) {
        if (local_frontier[threadIdx.x] == edgeArray[i]) {
            unsigned int neighbor = edgeArrayAux[i];
            if (!visited[neighbor]) {
                if (atomicCAS(&visited[neighbor], 0, 1) == 0) {
                    cost[neighbor] = cost[local_frontier[threadIdx.x]] + 1;
                    unsigned int pos = atomicAdd((unsigned int*)frontier_length, 1);
                    // Make sure we do not exceed the work queue size
                    if (pos < w_q_size) {
                        frontier[pos] = neighbor;
                    }
                }
            }
        }
    }
}