#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block_spill(volatile unsigned int *frontier, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, const unsigned int max_mem) {
    // Calculate thread and block indices
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory access latency
    extern __shared__ unsigned int shared_frontier[];

    // Loop over the frontier in chunks of the total number of threads
    for (int i = tid; i < frontier_len; i += stride) {
        unsigned int vertex = frontier[i];
        unsigned int startEdge = edgeArray[vertex];
        unsigned int endEdge = edgeArray[vertex + 1];

        for (int edge = startEdge; edge < endEdge; ++edge) {
            unsigned int neighbor = edgeArrayAux[edge];

            // Use atomic operation to ensure each vertex is processed only once
            if (atomicExch((int *)&visited[neighbor], 1) == 0) {
                cost[neighbor] = cost[vertex] + 1;

                // Synchronize thread access to shared memory
                int index = atomicAdd((int *)frontier_length, 1);

                // Avoid memory overflow
                if (index < max_mem) {
                    shared_frontier[index] = neighbor;
                }
            }
        }
    }

    // Write back to the global memory from shared memory
    __syncthreads();
    for (int i = tid; i < *frontier_length; i += stride) {
        frontier[i] = shared_frontier[i];
    }
}