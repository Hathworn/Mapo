```c
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
    for (long curDistBase = blockIdx.x * blockDim.y; curDistBase < distributions; curDistBase += gridDim.x * blockDim.y) {
        long curDist = curDistBase + threadIdx.y;

        // Only active threads update random numbers, reducing calls to hiprand_uniform
        float r = threadIdx.x == 0 && curDist < distributions ? hiprand_uniform(&state[blockIdx.x]) : 0.0f;

        // Synchronize within the warp to ensure r is broadcasted properly
        r = __shfl_sync(0xFFFFFFFF, r, 0);

        if (threadIdx.x == 0 && curDist < distributions) {
            int choice = binarySearchForMultinomial(
                normDistPrefixSum + curDist * categories,
                categories,
                r
            );
            dest[curDist * totalSamples + sample] = float(choice) + 1.0f;
            origDist[curDist * categories + choice] = 0.0f;
        }
    }
}