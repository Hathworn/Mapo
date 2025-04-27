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
    // Use blockIdx.y for additional parallelism if needed
    long distPerBlock = blockDim.y * gridDim.x;
    
    // Distribute work among blocks to reduce iteration overhead
    for (long curDist = blockIdx.x + blockIdx.y * gridDim.x;
         curDist < distributions;
         curDist += distPerBlock) {

        // Optimize loop increments and use parallelism within a block
        for (int sampleBase = threadIdx.y;
             sampleBase < totalSamples;
             sampleBase += blockDim.y) {
            
            float r = hiprand_uniform(&state[blockIdx.x]);
            
            int choice = binarySearchForMultinomial(
                normDistPrefixSum + curDist * categories,
                categories, r);
                
            dest[curDist * totalSamples + sampleBase] = static_cast<float>(choice) + 1.0f;
        }
    }
}