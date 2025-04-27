#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulatedPartSizesKernel(int size, int *part, int *weights, int *accumulatedSize) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        int thisPart = part[idx];
        // Using atomic add for safe concurrent updates
        if (idx == size - 1 || thisPart != part[idx + 1]) {
            atomicAdd(&accumulatedSize[thisPart], weights[idx]);
        }
    }
}