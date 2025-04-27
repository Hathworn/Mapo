#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MarkSplits(int size, bool force, int minPartSize, int maxPartSize, int* partSizes, int* splitsToMake) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= size) return;  // Early exit for out-of-bound threads

    int currentSize = partSizes[idx];
    bool shouldSplit = currentSize > maxPartSize && (force || currentSize > minPartSize * 2);
    splitsToMake[idx] = static_cast<int>(shouldSplit);  // Use type casting for clarity
}