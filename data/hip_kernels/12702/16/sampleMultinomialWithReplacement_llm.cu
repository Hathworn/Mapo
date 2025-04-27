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
        start = 0; // Return the first element if no probability mass
    }

    return start;
}

__global__ void sampleMultinomialWithReplacement(hiprandStateMtgp32* state, int totalSamples, float* dest, long distributions, int categories, float* normDistPrefixSum) {
    long curDist = blockIdx.x; // Each block handles one distribution

    if (curDist < distributions) { // Ensure curDist is in range
        for (int sampleBase = 0; sampleBase < totalSamples; sampleBase += blockDim.y) {
            int sample = sampleBase + threadIdx.y; // Each thread calculates one sample

            float r = hiprand_uniform(&state[blockIdx.x]); // Generate random number

            if (threadIdx.x == 0 && sample < totalSamples) {
                // Find the bucket that a uniform sample lies in
                int choice = binarySearchForMultinomial(normDistPrefixSum + curDist * categories, categories, r);
                dest[curDist * totalSamples + sample] = (float)choice + 1.0f; // Store 1-based result
            }
        }
    }
}