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
        // No probability mass or precision problems; just return the
        // first element
        start = 0;
    }

    return start;
}

__global__ void sampleMultinomialWithReplacement(hiprandStateMtgp32* state, int totalSamples, float* dest, long distributions, int categories, float* normDistPrefixSum) {
    // Optimize by using blockDim.y as part of loop increment
    for (long curDist = blockIdx.x; curDist < distributions; curDist += gridDim.x) {
        for (int sampleBase = threadIdx.y; sampleBase < totalSamples; sampleBase += blockDim.y) {
            // Each thread handles its own sample
            float r = hiprand_uniform(&state[blockIdx.x]);

            // Avoid divergence by using the condition within each sample loop
            if (sampleBase < totalSamples) {
                // Find the bucket that a uniform sample lies in
                int choice = binarySearchForMultinomial(
                    normDistPrefixSum + curDist * categories,
                    categories,
                    r);

                // Torch indices are 1-based
                dest[curDist * totalSamples + sampleBase] = (float) choice + 1.0f;
            }
        }
    }
}