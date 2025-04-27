#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void assignColIds(int* colIds, const int* colOffsets) {
    int myId = blockIdx.x;
    int start = colOffsets[myId];
    int end = colOffsets[myId + 1];
    int totalThreads = blockDim.x * gridDim.x;
    int globalId = blockIdx.x * blockDim.x + threadIdx.x;

    // Use globalId to distribute threads more evenly across blocks
    for (int id = start + globalId - myId * blockDim.x; id < end; id += totalThreads) {
        colIds[id] = myId;
    }
}