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
    // Use shared memory for reading prefix sums
    __shared__ float sharedPrefixSum[1024]; // Assumes categories <= 1024 for simplicity

    for (long curDist = blockIdx.x; curDist < distributions; curDist += gridDim.x) {
        // Load prefix sums into shared memory
        if (threadIdx.x < categories) {
            sharedPrefixSum[threadIdx.x] = normDistPrefixSum[curDist * categories + threadIdx.x];
        }
        __syncthreads(); // Ensure the prefix sums are loaded

        for (int sampleBase = blockIdx.y * blockDim.y; sampleBase < totalSamples; sampleBase += gridDim.y * blockDim.y) {
            int sample = sampleBase + threadIdx.y;

            // Use cooperative groups to manage synchronization within a warp
            if (sample < totalSamples) {
                float r = hiprand_uniform(&state[blockIdx.x * blockDim.y + threadIdx.y]);

                // Individual threads compute choices within the warp
                int choice = binarySearchForMultinomial(sharedPrefixSum, categories, r);

                if (threadIdx.x == 0) {
                    dest[curDist * totalSamples + sample] = (float)choice + 1.0f;
                }
            }
        }
        __syncthreads(); // Ensure all samples are processed before the next distribution
    }
}