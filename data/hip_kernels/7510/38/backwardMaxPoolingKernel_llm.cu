#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backwardMaxPoolingKernel ( int batchSize, int* lengths, int numberEntriesPerInstance, int numberRows, int* maxIndices, float* chain, float* result) {
    int indexInstance = blockIdx.x;
    int indexRow = blockIdx.y;
    int indexColumn = threadIdx.x;

    int startInstanceWithinBatch = indexInstance * numberEntriesPerInstance;
    int startColumnWithinInstance = indexColumn * numberRows;
    int indexEntryWithinBatch = startInstanceWithinBatch + startColumnWithinInstance + indexRow;

    if(indexInstance < batchSize) {
        int length = lengths[indexInstance];

        if(indexColumn < length) {
            // Use shared memory to reduce repeated global memory access
            __shared__ int sharedMaxIndices[blockDim.x];
            __shared__ float sharedChain[blockDim.x];
            if(threadIdx.x == 0) {
                sharedMaxIndices[indexRow] = maxIndices[indexInstance * numberRows + indexRow];
                sharedChain[indexRow] = chain[indexInstance * numberRows + indexRow];
            }
            __syncthreads();

            int maxIndex = sharedMaxIndices[indexRow];

            if(indexEntryWithinBatch == maxIndex) {
                result[indexEntryWithinBatch] = sharedChain[indexRow];
            } else {
                result[indexEntryWithinBatch] = 0.0;
            }
        } else {
            result[indexEntryWithinBatch] = nanf("NaN");
        }
    } else {
        result[indexEntryWithinBatch] = nanf("NaN");
    }
}