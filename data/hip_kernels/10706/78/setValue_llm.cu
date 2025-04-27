#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    // Use warp size to parallelize the operation
    int laneID = threadIdx.x % warpSize;
    if (laneID == 0) {
        atomicExch(&data[idx], value);
    }
}