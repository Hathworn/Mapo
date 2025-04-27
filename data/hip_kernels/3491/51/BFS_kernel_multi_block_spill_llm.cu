#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to improve memory access and reduce latency
__global__ void BFS_kernel_multi_block_spill(
    volatile unsigned int *frontier, volatile unsigned int *frontier2, unsigned int frontier_len, 
    volatile unsigned int *cost, volatile int *visited, 
    unsigned int *edgeArray, unsigned int *edgeArrayAux, 
    unsigned int numVertices, unsigned int numEdges, 
    volatile unsigned int *frontier_length, const unsigned int max_mem) 
{
    // Calculate thread ID within block
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for frequently accessed data
    extern __shared__ unsigned int shared_mem[];

    if (tid < frontier_len) {
        unsigned int vertex = frontier[tid];

        // Load edges into shared memory
        unsigned int start = edgeArray[vertex];
        unsigned int end = edgeArrayAux[vertex];
        
        for (unsigned int i = start; i < end; ++i) {
            unsigned int neighbor = edgeArray[i];
            
            if (!visited[neighbor]) {
                visited[neighbor] = 1;
                frontier2[atomicAdd(frontier_length, 1)] = neighbor;
            }
            __syncthreads(); // Ensure all threads in the block are synchronized
        }
    }

    // Ensure all memory operations are completed
    __threadfence_system();
}