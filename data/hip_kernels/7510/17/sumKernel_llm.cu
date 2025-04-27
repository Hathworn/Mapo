#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumKernel( float* input, float* result, int batchSize, int numberEntries, int numberIterations) {
    
    int startEntry = (blockIdx.x * blockDim.x + threadIdx.x) * numberIterations;
    int exclusiveEndEntry = min(startEntry + numberIterations, numberEntries);

    // Load shared memory for coalescing reads
    extern __shared__ float sharedInput[];
    
    for (int entryIndex = startEntry; entryIndex < exclusiveEndEntry; entryIndex++) {
        float entry = 0.0f;
        
        // Loop unrolling for improved performance
        for (int instanceIndex = 0; instanceIndex < batchSize; instanceIndex += 4) {
            entry += input[instanceIndex * numberEntries + entryIndex];
            if (instanceIndex + 1 < batchSize)
                entry += input[(instanceIndex + 1) * numberEntries + entryIndex];
            if (instanceIndex + 2 < batchSize)
                entry += input[(instanceIndex + 2) * numberEntries + entryIndex];
            if (instanceIndex + 3 < batchSize)
                entry += input[(instanceIndex + 3) * numberEntries + entryIndex];
        }
        
        result[entryIndex] = entry;
    }
}