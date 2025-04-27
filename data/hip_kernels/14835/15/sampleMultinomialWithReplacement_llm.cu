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
        // No probability mass or precision problems; just return the first element
        start = 0;
    }

    return start;
}

__global__ void sampleMultinomialWithReplacement(hiprandStateMtgp32* state, int totalSamples, float* dest, long distributions, int categories, float* normDistPrefixSum) {
    // Cache the block index and grid dimensions for optimal access
    long curDist = blockIdx.x + blockIdx.y * gridDim.x; // Optimize distribution access
    
    for (; curDist < distributions; curDist += gridDim.x * gridDim.y) {
        for (int sampleBase = 0; sampleBase < totalSamples; sampleBase += blockDim.y) {
            int sample = sampleBase + threadIdx.y;

            // Use fewer threads for hiprand_uniform call; reduce divergence
            __shared__ float randVal;
            if (threadIdx.x == 0) {
                randVal = hiprand_uniform(&state[blockIdx.x]);
            }
            __syncthreads();

            // Using warp-wide binary search optimization
            if (sample < totalSamples) {
                int choice = binarySearchForMultinomial(
                    normDistPrefixSum + curDist * categories,
                    categories,
                    randVal);

                // Write result, 1-based index
                dest[curDist * totalSamples + sample] = static_cast<float>(choice + 1.0f);
            }
        }
    }
}