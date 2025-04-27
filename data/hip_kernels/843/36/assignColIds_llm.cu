#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void assignColIds(int* colIds, const int* colOffsets) {
    int myId = blockIdx.x;
    int start = colOffsets[myId];
    int end = colOffsets[myId + 1];
    int stride = blockDim.x * gridDim.x; // Calculate stride for improved occupancy
    for (int id = start + threadIdx.x; id < end; id += stride) { // Use stride for loop increments
        colIds[id] = myId;
    }
}