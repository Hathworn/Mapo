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

    // Use shared memory for random states to reduce global memory accesses
    __shared__ float sharedRandom[32];
    
    for (long curDist = blockIdx.x; curDist < distributions; curDist += gridDim.x) {
        
        for (int sampleBase = 0; sampleBase < totalSamples; sampleBase += blockDim.y) {
            
            int sample = sampleBase + threadIdx.y;
            
            // Each thread in a warp generates its own random number, saved in shared memory
            sharedRandom[threadIdx.y] = hiprand_uniform(&state[blockIdx.x]);
            __syncthreads(); // Ensure all random numbers are generated before proceeding

            if (threadIdx.x == 0 && sample < totalSamples) {
                float r = sharedRandom[threadIdx.y]; // Read random number from shared memory

                int choice = binarySearchForMultinomial(
                    normDistPrefixSum + curDist * categories,
                    categories,
                    r);

                dest[curDist * totalSamples + sample] = (float) choice + 1.0f;
            }
        }
    }
}