#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mapAdjacencyToBlockKernel(int size, int *adjIndexes, int *adjacency, int *adjacencyBlockLabel, int *blockMappedAdjacency, int *fineAggregate) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        int begin = adjIndexes[idx];
        int end = adjIndexes[idx + 1];
        int thisBlock = fineAggregate[idx];

        // Use shared memory for thread block wide reuse
        extern __shared__ int sharedMem[]; 
        int *sharedAdjacency = sharedMem;
        int *sharedFineAggregate = sharedMem + blockDim.x;

        // Load adjacency and fineAggregate data into shared memory
        if (threadIdx.x < end - begin) {
            sharedAdjacency[threadIdx.x] = adjacency[begin + threadIdx.x];
            sharedFineAggregate[threadIdx.x] = fineAggregate[sharedAdjacency[threadIdx.x]];
        }
        __syncthreads();

        // Fill block labeled adjacency and block mapped adjacency vectors
        for (int i = 0; i < end - begin; i++) {
            int neighbor = sharedFineAggregate[i];

            if (thisBlock == neighbor) { // Coalesce accesses to global memory
                adjacencyBlockLabel[begin + i] = -1;
                blockMappedAdjacency[begin + i] = -1;
            } else {
                adjacencyBlockLabel[begin + i] = thisBlock;
                blockMappedAdjacency[begin + i] = neighbor;
            }
        }
    }
}