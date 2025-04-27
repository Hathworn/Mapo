#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignColIds(int* colIds, const int* colOffsets) {
    int myId = blockIdx.x;
    int start = colOffsets[myId];
    int end = colOffsets[myId + 1];
    int threadId = threadIdx.x;
    int blockDimSize = blockDim.x;

    // Use shared memory for faster access
    extern __shared__ int sharedColOffsets[];

    if (threadId < 2) {
        sharedColOffsets[threadId] = colOffsets[myId + threadId];
    }

    __syncthreads();

    start = sharedColOffsets[0];
    end = sharedColOffsets[1];

    for (int id = start + threadId; id < end; id += blockDimSize) {
        colIds[id] = myId;
    }
}