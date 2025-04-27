#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_warp(unsigned int *levels, unsigned int *edgeArray, unsigned int *edgeArrayAux, int W_SZ, int CHUNK_SZ, unsigned int numVertices, int curr, int *flag) {
    // Calculate the unique warp ID within the grid
    unsigned int warpId = (blockIdx.x * blockDim.x + threadIdx.x) / W_SZ;

    // Calculate the lane index within the warp
    unsigned int laneId = threadIdx.x % W_SZ;

    // Calculate vertex for this thread to work on, stepping by the number of warps
    for (unsigned int vertex = warpId; vertex < numVertices; vertex += gridDim.x * blockDim.x / W_SZ) {
        // Perform work using warp-level primitives for efficiency
        unsigned int startEdge = edgeArray[vertex];
        unsigned int edgeCount = edgeArray[vertex + 1] - startEdge;

        // Traverse edges in chunks
        for (unsigned int edgeIndex = laneId; edgeIndex < edgeCount; edgeIndex += W_SZ) {
            unsigned int neighbor = edgeArrayAux[startEdge + edgeIndex];

            // If the level is uninitialized, set the level and update the flag
            if (levels[neighbor] == UINT_MAX) {
                levels[neighbor] = curr + 1;
                *flag = 1;
            }
        }
    }
}