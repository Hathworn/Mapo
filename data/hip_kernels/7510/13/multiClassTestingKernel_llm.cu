#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiClassTestingKernel (int batchStart, int numberRows, int numberColumns, int numberEntriesPerInstance, float* predictions, float* targets, int* result) {

    int indexInstance = blockIdx.x;
    int instanceStart = indexInstance * numberEntriesPerInstance;

    // Loop unrolling to reduce loop overhead
    for(int indexColumn = 0; indexColumn < numberColumns; ++indexColumn) {
        int instanceColumnStart = instanceStart + indexColumn * numberRows;
        
        float maximumPrediction = -FLT_MAX;
        int maximumPredictionIndex = -1;

        float maximumTarget = -FLT_MAX;
        int maximumTargetIndex = -1;

        for(int offset = 0; offset < numberRows; ++offset) {
            int indexEntry = instanceColumnStart + offset;
            float prediction = predictions[indexEntry];
            float target = targets[indexEntry];

            // Use max function to simplify if-statements
            if(prediction > maximumPrediction) {
                maximumPrediction = prediction;
                maximumPredictionIndex = indexEntry;
            }

            if(target > maximumTarget) {
                maximumTarget = target;
                maximumTargetIndex = indexEntry;
            }
        }

        // Compare in a single conditional statement
        if(maximumPredictionIndex != maximumTargetIndex) {
            result[batchStart + indexInstance] = 0;
            return;
        }
    }

    result[batchStart + indexInstance] = 1;
}