#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void splitNodes(int* octree, int* numNodes, int poolSize, int startNode) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to avoid unnecessary computations
    if (index < poolSize) {
        int node = octree[2 * (index + startNode)];

        // Split node if flagged
        if (node & 0x40000000) {
            // Atomically add 8 to get new node index
            int newNode = atomicAdd(numNodes, 8);

            // Update node to point to new node tile
            int baseIdx = 2 * (index + startNode);
            octree[baseIdx] = (node & 0xC0000000) | (newNode & 0x3FFFFFFF);

            // Use unrolled loop for initialization of new child nodes
            #pragma unroll
            for (int off = 0; off < 8; ++off) {
                int childIdx = 2 * (newNode + off);
                octree[childIdx] = 0;
                octree[childIdx + 1] = 0;
            }
        }
    }
}