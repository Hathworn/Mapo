#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGather(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use early return pattern to improve warp efficiency
    if (idx >= sparseSize || sparseIndices[idx] < -offset || sparseIndices[idx] + offset >= denseSize) 
        return;

    sparseData[idx] = denseData[sparseIndices[idx] + offset];
}