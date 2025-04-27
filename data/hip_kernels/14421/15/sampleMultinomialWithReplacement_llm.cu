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

__global__ void sampleMultinomialWithReplacement(hiprandStateMtgp32* state, int totalSamples, float* dest, long distributions, int categories, float* normDistPrefixSum) {
    for (long curDist = blockIdx.x; curDist < distributions; curDist += gridDim.x) {
        for (int sampleBase = 0; sampleBase < totalSamples; sampleBase += blockDim.y) {
            int sample = sampleBase + threadIdx.y;

            float r = hiprand_uniform(&state[blockIdx.x]);

            // Parallelize binary search using warp-level synchronization
            if (sample < totalSamples) {
                __shared__ int sharedChoice[32];  // Use shared memory for warp-level reduction
                int choice = binarySearchForMultinomial(
                    normDistPrefixSum + curDist * categories,
                    categories,
                    r
                );
                sharedChoice[threadIdx.y] = choice;  // Store result in shared memory

                __syncthreads();  // Synchronize threads within the warp
                if (threadIdx.x == 0) {  // First thread in the warp writes the result
                    dest[curDist * totalSamples + sample] = (float) sharedChoice[threadIdx.y] + 1.0f;
                }
            }
        }
    }
}