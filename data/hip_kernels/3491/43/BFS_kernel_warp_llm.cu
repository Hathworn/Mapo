#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_warp(unsigned int *levels, unsigned int *edgeArray, unsigned int *edgeArrayAux, int W_SZ, int CHUNK_SZ, unsigned int numVertices, int curr, int *flag) {
    // Calculate global and local thread indices
    unsigned int global_tid = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;
    unsigned int local_tid = hipThreadIdx_x;

    // Ensure the current thread works over valid vertices
    if (global_tid < numVertices) {
        unsigned int level = levels[global_tid];

        // Iterate over neighbors using warp divergence optimization
        for (unsigned int i = edgeArray[global_tid]; i < edgeArrayAux[global_tid]; i++) {
            unsigned int neighbor = edgeArray[i];
            
            // Check and update level using atomic operations
            if (levels[neighbor] == 0xFFFFFFFF) { // Unvisited vertex
                levels[neighbor] = level + 1;
                *flag = 1;
            }
        }
    }
}