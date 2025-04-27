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

__global__ void sampleMultinomialWithoutReplacement(hiprandStateMtgp32* state, int totalSamples, int sample, float* dest, long distributions, int categories, float* origDist, float* normDistPrefixSum) {
    // Using shared memory to reduce global memory access
    extern __shared__ float sharedMem[];

    for (long curDistBase = blockIdx.x * blockDim.y;
         curDistBase < distributions;
         curDistBase += gridDim.x * blockDim.y) {
        long curDist = curDistBase + threadIdx.y;

        if (curDist < distributions) {
            // Load distribution into shared memory
            if (threadIdx.x < categories) {
                sharedMem[threadIdx.x] = normDistPrefixSum[curDist * categories + threadIdx.x];
            }
            __syncthreads();  // Ensure all memory loads are complete

            float r = hiprand_uniform(&state[blockIdx.x]);
            if (threadIdx.x == 0) {
                // Use shared memory for binary search
                int choice = binarySearchForMultinomial(sharedMem, categories, r);

                // Torch indices are 1-based
                dest[curDist * totalSamples + sample] = (float) choice + 1.0f;

                // Update the original probability so it is
                // not considered a second time
                origDist[curDist * categories + choice] = 0.0f;
            }
        }
    }
}