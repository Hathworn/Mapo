#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiClassTestingKernel(int batchStart, int numberRows, int numberColumns, int numberEntriesPerInstance, float* predictions, float* targets, int* result) {

    int indexInstance = blockIdx.x;
    int instanceStart = indexInstance * numberEntriesPerInstance;

    // Cache batchStart + indexInstance to avoid recalculating
    int resultIndex = batchStart + indexInstance;

    bool allMatched = true; // Flag to determine if all columns matched

    for (int indexColumn = 0; indexColumn < numberColumns; indexColumn++) {
        int instanceColumnStart = instanceStart + indexColumn * numberRows;
        float maximumPrediction = 0;
        int maximumPredictionIndex = -1;

        float maximumTarget = 0;
        int maximumTargetIndex = -1;

        // Unroll loop with pragma for potential performance gains
        #pragma unroll
        for (int indexEntryOffset = 0; indexEntryOffset < numberRows; indexEntryOffset++) {
            int indexEntry = instanceColumnStart + indexEntryOffset;
            float prediction = predictions[indexEntry];
            float target = targets[indexEntry];

            if (prediction > maximumPrediction) {
                maximumPrediction = prediction;
                maximumPredictionIndex = indexEntryOffset; // Use offset index for comparison
            }

            if (target > maximumTarget) {
                maximumTarget = target;
                maximumTargetIndex = indexEntryOffset;
            }
        }

        // Check if predictions and targets match, break early if not matched
        if (maximumPredictionIndex != maximumTargetIndex) {
            allMatched = false;
            break;
        }
    }

    result[resultIndex] = allMatched ? 1 : 0; // Set result based on match flag
}