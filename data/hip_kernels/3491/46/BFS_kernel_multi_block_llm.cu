#include "hip/hip_runtime.h"
#include "includes.h"

// Simplified kernel function name
__global__ void BFS_optimized_kernel(
    volatile unsigned int *frontier,
    volatile unsigned int *frontier2,
    unsigned int frontier_len,
    volatile unsigned int *cost,
    volatile int *visited,
    unsigned int *edgeArray,
    unsigned int *edgeArrayAux,
    unsigned int numVertices,
    unsigned int numEdges,
    volatile unsigned int *frontier_length,
    unsigned int NUM_P_PER_MP,
    unsigned int W_Q_SIZE) 
{
    // Obtain thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure threads do not exceed frontier length
    if (tid < frontier_len) {
        unsigned int vertex = frontier[tid];
        
        // Process edges of the current vertex
        unsigned int start_edge = edgeArrayAux[vertex];
        unsigned int end_edge = edgeArrayAux[vertex + 1];
        
        for (unsigned int edge = start_edge; edge < end_edge; ++edge) {
            unsigned int neighbor = edgeArray[edge];
            
            // Check if the neighbor has already been visited
            if (visited[neighbor] == 0) {
                visited[neighbor] = 1;
                frontier2[atomicAdd(frontier_length, 1)] = neighbor;
                
                // Update cost
                cost[neighbor] = cost[vertex] + 1;
            }
        }
    }
}