#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int binarySearchForMultinomial(float* dist, int size, float val) {
    int start = 0;
    int end = size;

    while (end - start > 0) {
        int mid = start + (end - start) / 2;
        float midVal = dist[mid];
        if (midVal < val) {
            start = mid + 1;
        } else {
            end = mid;
        }
    }
    if (start == size) {
        start = 0;
    }
    return start;
}

__global__ void sampleMultinomialWithoutReplacement(hiprandStateMtgp32* state, int totalSamples, int sample, float* dest, long distributions, int categories, float* origDist, float* normDistPrefixSum) {
    // Efficiently compute the curDist for this thread
    long curDistBase = blockIdx.x * blockDim.y + threadIdx.y;
    
    if (curDistBase < distributions) {
        float r = hiprand_uniform(&state[blockIdx.x]);
        if (threadIdx.x == 0) {
            // Perform binary search to find the choice
            int choice = binarySearchForMultinomial(
                normDistPrefixSum + curDistBase * categories,
                categories,
                r);

            // Update the result array and original distribution
            dest[curDistBase * totalSamples + sample] = static_cast<float>(choice + 1);
            origDist[curDistBase * categories + choice] = 0.0f;
        }
    }
}
```
