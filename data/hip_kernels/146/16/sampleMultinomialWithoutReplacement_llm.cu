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
        start = 0;
    }

    return start;
}

__global__ void sampleMultinomialWithoutReplacement(hiprandStateMtgp32* state, int totalSamples, int sample, float* dest, long distributions, int categories, float* origDist, float* normDistPrefixSum) {
    // Optimize thread collaboration; reduce per-thread work
    const long threads_per_dist = blockDim.y;
    const long dist_per_block = gridDim.x * threads_per_dist;

    long curDistBase = blockIdx.x * threads_per_dist + threadIdx.y;
    while (curDistBase < distributions) {
        // Load random number only once per warp
        float r = hiprand_uniform(&state[blockIdx.x]);

        if (threadIdx.x == 0 && curDistBase < distributions) {
            int choice = binarySearchForMultinomial(normDistPrefixSum + curDistBase * categories, categories, r);
            dest[curDistBase * totalSamples + sample] = (float) choice + 1.0f;
            origDist[curDistBase * categories + choice] = 0.0f;
        }
        
        // Move to the next distribution for the block
        curDistBase += dist_per_block;
    }
}