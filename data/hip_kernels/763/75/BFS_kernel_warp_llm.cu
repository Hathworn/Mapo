#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_warp( unsigned int *levels, unsigned int *edgeArray, unsigned int *edgeArrayAux, int W_SZ, int CHUNK_SZ, unsigned int numVertices, int curr, int *flag) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use warp-synchronous programming to improve access pattern and reduce divergence
    int warpId = tid / W_SZ;  // Determine the warp ID
    int laneId = tid % W_SZ;  // Determine the lane ID within the warp
    
    // Process each chunk by iterating in steps of warp size
    for (int vertexIdx = warpId * CHUNK_SZ; vertexIdx < numVertices; vertexIdx += gridDim.x * CHUNK_SZ) {
        if (vertexIdx + laneId < numVertices) {
            // Read and process each edge in the chunk
            unsigned int vertex = vertexIdx + laneId;
            if (levels[vertex] == curr) {
                for (unsigned int edgeIdx = edgeArrayAux[vertex]; edgeIdx < edgeArrayAux[vertex + 1]; edgeIdx++) {
                    unsigned int neighbor = edgeArray[edgeIdx];

                    // Atomically update the level for each neighbor
                    if (atomicCAS(&levels[neighbor], UINT_MAX, curr + 1) == UINT_MAX) {
                        *flag = 1;  // Set the flag if any new node is discovered
                    }
                }
            }
        }
    }
}