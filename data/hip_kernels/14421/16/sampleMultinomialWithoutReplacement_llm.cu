#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int binarySearchForMultinomial(float* dist, int size, float val) {
    int start = 0;
    int end = size;

    while (end - start > 0) {
        int mid = start + (end - start) / 2;
        float midVal = dist[mid];
        
        // Check mid value against threshold
        if (midVal < val) {
            start = mid + 1;
        } else {
            end = mid;
        }
    }

    // Handle edge case outside range
    if (start == size) {
        start = 0;
    }

    return start;
}

__global__ void sampleMultinomialWithoutReplacement(hiprandStateMtgp32* state, int totalSamples, int sample, float* dest, long distributions, int categories, float* origDist, float* normDistPrefixSum) {
    // Efficient loop unrolling and memory access
    for (long curDistBase = blockIdx.x * blockDim.y; curDistBase < distributions; curDistBase += gridDim.x * blockDim.y) {
        long curDist = curDistBase + threadIdx.y;
        
        // Uniform generation outside critical section
        __shared__ float r;
        if (threadIdx.x == 0) {
            if (curDist < distributions) {
                r = hiprand_uniform(&state[blockIdx.x]);
            }
        }
        __syncthreads();

        if (threadIdx.x == 0 && curDist < distributions) {
            // Perform binary search on the cumulative distribution
            int choice = binarySearchForMultinomial(normDistPrefixSum + curDist * categories, categories, r);

            // Assign sample to output with correction for indexing
            dest[curDist * totalSamples + sample] = (float) choice + 1.0f;

            // Zero out the used probability
            origDist[curDist * categories + choice] = 0.0f;
        }
    }
}