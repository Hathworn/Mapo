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
    for (long curDist = blockIdx.x; curDist < distributions; curDist += gridDim.x) {
        for (int sampleBase = 0; sampleBase < totalSamples; sampleBase += blockDim.y) {
            int sample = sampleBase + threadIdx.y;
            float r = 0.0f;
            
            // Load-balanced warp divergence reduction
            if (threadIdx.y == 0) {
                r = hiprand_uniform(&state[blockIdx.x]);
            }
            r = __shfl_sync(0xFFFFFFFF, r, 0); // Broadcast r to all threads in a warp
            
            if (threadIdx.x == 0 && sample < totalSamples) {
                int choice = binarySearchForMultinomial(
                    normDistPrefixSum + curDist * categories,
                    categories,
                    r
                );
                dest[curDist * totalSamples + sample] = (float)choice + 1.0f;
            }
        }
    }
}