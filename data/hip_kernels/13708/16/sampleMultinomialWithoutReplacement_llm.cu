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
    long curDistBase = blockIdx.x * blockDim.y + threadIdx.y;
    
    if (curDistBase < distributions) { // Limit work to available distributions
        // Each thread computes its own random number within the warp
        float r = hiprand_uniform(&state[blockIdx.x]);
        
        if (threadIdx.x == 0) { // Only first thread in warp performs the write and update
            int choice = binarySearchForMultinomial(
                normDistPrefixSum + curDistBase * categories,
                categories,
                r);

            dest[curDistBase * totalSamples + sample] = (float)choice + 1.0f; // Store result as 1-based index

            origDist[curDistBase * categories + choice] = 0.0f; // Set probability to 0 for no replacement
        }
    }
}