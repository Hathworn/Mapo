#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mapAdjacencyToBlockKernel(int size, int *adjIndexes, int *adjacency, int *adjacencyBlockLabel, int *blockMappedAdjacency, int *fineAggregate) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        int begin = adjIndexes[idx];
        int end = adjIndexes[idx + 1];
        int thisBlock = fineAggregate[idx];

        // Use shared memory to reduce global memory access
        __shared__ int sharedFineAggregate[256]; // Assuming max blockDim.x is 256
        if (threadIdx.x < 256)
            sharedFineAggregate[threadIdx.x] = fineAggregate[threadIdx.x];
        __syncthreads();

        // Fill block labeled adjacency and block mapped adjacency vectors
        for (int i = begin; i < end; i++) {
            int neighbor = sharedFineAggregate[adjacency[i]];

            if (thisBlock == neighbor) {
                adjacencyBlockLabel[i] = -1;
                blockMappedAdjacency[i] = -1;
            } else {
                adjacencyBlockLabel[i] = thisBlock;
                blockMappedAdjacency[i] = neighbor;
            }
        }
    }
}