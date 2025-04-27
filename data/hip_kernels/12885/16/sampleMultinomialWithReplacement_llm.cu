```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int binarySearchForMultinomial(float* dist, int size, float val) {
    int start = 0;
    int end = size;

    while (end - start > 0) {
        int mid = start + (end - start) / 2;
        
        // Access dist mid only once and compare
        float midVal = dist[mid];
        if (midVal < val) {
            start = mid + 1;
        } else {
            end = mid;
        }
    }

    if (start == size) {
        start = 0;  // Return the first element if outside range
    }

    return start;
}

__global__ void sampleMultinomialWithReplacement(hiprandStateMtgp32* state, int totalSamples, float* dest, long distributions, int categories, float* normDistPrefixSum) {
    for (long curDist = blockIdx.x; curDist < distributions; curDist += gridDim.x) {
        for (int sampleBase = 0; sampleBase < totalSamples; sampleBase += blockDim.y) {
            int sample = sampleBase + threadIdx.y;

            // Use shared memory to reduce redundant accesses or computations
            __shared__ float r[1];
            if (threadIdx.x == 0 && sample < totalSamples) {
                r[0] = hiprand_uniform(&state[blockIdx.x]);
            }
            __syncthreads();

            if (threadIdx.x == 0 && sample < totalSamples) {
                // Perform binary search to find the correct category
                int choice = binarySearchForMultinomial(normDistPrefixSum + curDist * categories, categories, r[0]);
                
                // Store the result with added 1.0 offset for 1-based index
                dest[curDist * totalSamples + sample] = (float) choice + 1.0f;
            }
        }
    }
}