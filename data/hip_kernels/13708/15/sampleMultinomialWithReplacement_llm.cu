#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int binarySearchForMultinomial(float* dist, int size, float val) {
    int start = 0;
    int end = size;

    while (end - start > 0) {
        int mid = (start + end) >> 1; // Optimized: Integer division replaced with bit shift
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

__global__ void sampleMultinomialWithReplacement(hiprandStateMtgp32* state, int totalSamples, float* dest, long distributions, int categories, float* normDistPrefixSum) {
    // Calculate current distribution index
    long curDist = blockIdx.x;

    while (curDist < distributions) {
        // Calculate sample index base for this block's work
        int sampleBase = (blockDim.y * blockIdx.y + threadIdx.y);

        while (sampleBase < totalSamples) {
            // Only compute if sample index is valid
            if (sampleBase < totalSamples) {
                // Each thread gets its own random number
                float r = hiprand_uniform(&state[blockIdx.x * blockDim.y + threadIdx.y]);

                // Threads in the warp execute the search independently for different indices
                int choice = binarySearchForMultinomial(normDistPrefixSum + curDist * categories, categories, r);

                // Increment the sample index directly
                int sample = sampleBase;
                // Write the result to the destination array
                dest[curDist * totalSamples + sample] = (float) choice + 1.0f;
            }

            // Move to the next set of samples handled by this block
            sampleBase += gridDim.y * blockDim.y;
        }

        // Move to the next distribution handled by this block
        curDist += gridDim.x;
    }
}