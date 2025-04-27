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
    // Optimize memory access by using shared memory for prefix sums
    extern __shared__ float sharedPrefixSum[];
    
    // Use cooperative threads to load distribution into shared memory
    for (long curDist = blockIdx.x; curDist < distributions; curDist += gridDim.x) {
        for (int c = threadIdx.x; c < categories; c += blockDim.x) {
            sharedPrefixSum[c] = normDistPrefixSum[curDist * categories + c];
        }
        __syncthreads();

        for (int sampleBase = 0; sampleBase < totalSamples; sampleBase += blockDim.y) {
            // The warp determines the sample
            int sample = sampleBase + threadIdx.y;

            // All threads participate in this
            float r = hiprand_uniform(&state[blockIdx.x]);

            if (threadIdx.x == 0 && sample < totalSamples) {
                // Find the bucket that a uniform sample lies in
                int choice = binarySearchForMultinomial(sharedPrefixSum, categories, r);

                // Torch indices are 1-based
                dest[curDist * totalSamples + sample] = (float) choice + 1.0f;
            }
        }
        __syncthreads();
    }
}