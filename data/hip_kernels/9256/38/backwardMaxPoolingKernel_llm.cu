#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backwardMaxPoolingKernel(int batchSize, int* lengths, int numberEntriesPerInstance, int numberRows, int* maxIndices, float* chain, float* result) {
    int indexInstance = blockIdx.x;
    int indexRow = blockIdx.y;
    int indexColumn = threadIdx.x;

    // Pre-compute reused values outside the conditional
    int startInstanceWithinBatch = indexInstance * numberEntriesPerInstance;
    int startColumnWithinInstance = indexColumn * numberRows;
    int indexEntryWithinBatch = startInstanceWithinBatch + startColumnWithinInstance + indexRow;

    if (indexInstance < batchSize) {
        int length = lengths[indexInstance];

        // Simplify conditional to check bounds first
        if (indexColumn < length) {
            int maxIndex = maxIndices[indexInstance * numberRows + indexRow];

            // Assign result based on whether it's a max index
            result[indexEntryWithinBatch] = (indexEntryWithinBatch == maxIndex) 
                                            ? chain[indexInstance * numberRows + indexRow]
                                            : 0.0f;
        } else {
            result[indexEntryWithinBatch] = nanf("NaN");
        }
    } else {
        result[indexEntryWithinBatch] = nanf("NaN");
    }
}