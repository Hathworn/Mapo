#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumKernel(float* input, float* result, int batchSize, int numberEntries, int numberIterations) {

    int startEntry = (blockIdx.x * blockDim.x + threadIdx.x) * numberIterations;
    int exclusiveEndEntry = min(startEntry + numberIterations, numberEntries);

    // Use registers for the entry variable to reduce memory access
    for (int entryIndex = startEntry; entryIndex < exclusiveEndEntry; entryIndex++) {
        
        float entry = 0.0f;

        // Use shared memory to cache input data within a block for faster access
        __shared__ float sharedInput[1024]; // Assumes batchSize * numberEntries <= 1024
        for (int instanceIndex = threadIdx.x; instanceIndex < batchSize; instanceIndex += blockDim.x) {
            sharedInput[instanceIndex * numberEntries + entryIndex] = input[instanceIndex * numberEntries + entryIndex];
        }
        __syncthreads();

        for (int instanceIndex = 0; instanceIndex < batchSize; instanceIndex++) {
            entry += sharedInput[instanceIndex * numberEntries + entryIndex];
        }

        result[entryIndex] = entry;
    }

}