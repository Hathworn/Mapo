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
    // Optimize loop bounds calculation for fewer instructions
    long curDistBase = blockIdx.x * blockDim.y;

    while (curDistBase < distributions) {
        long curDist = curDistBase + threadIdx.y;

        // Use a single atomic operation to set the random value
        float r = hiprand_uniform(&state[blockIdx.x]);

        if (threadIdx.x == 0 && curDist < distributions) {
            int choice = binarySearchForMultinomial(
                normDistPrefixSum + curDist * categories,
                categories,
                r);
                
            dest[curDist * totalSamples + sample] = (float) choice + 1.0f;
            origDist[curDist * categories + choice] = 0.0f;
        }
        // Increment curDistBase by the number of threads in y dimension
        curDistBase += gridDim.x * blockDim.y;
    }
}