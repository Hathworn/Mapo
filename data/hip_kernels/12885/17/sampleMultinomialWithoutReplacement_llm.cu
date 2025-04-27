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
        // No probability mass or precision problems; return the first element
        start = 0;
    }

    return start;
}

__global__ void sampleMultinomialWithoutReplacement(hiprandStateMtgp32* state, int totalSamples, int sample, float* dest, long distributions, int categories, float* origDist, float* normDistPrefixSum) {
    // Precompute distribution index limits
    long maxDistBase = gridDim.x * blockDim.y;
    
    // Loop over distributions handling within the block
    for (long curDistBase = blockIdx.x * blockDim.y; curDistBase < distributions; curDistBase += maxDistBase) {
        long curDist = curDistBase + threadIdx.y;

        // All threads must participate in this for random number generation
        float r = hiprand_uniform(&state[blockIdx.x]);

        if (threadIdx.x == 0 && curDist < distributions) {
            // Binary search for the sampled category
            int choice = binarySearchForMultinomial(normDistPrefixSum + curDist * categories, categories, r);

            // Store the sampled category, note 1-based index
            dest[curDist * totalSamples + sample] = (float) choice + 1.0f;

            // Update probability for non-replacement by setting it to zero
            origDist[curDist * categories + choice] = 0.0f;
        }
    }
}