#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void groupSumKernel( float* input, int* firstOccurrences, int* otherOccurrences, int* otherOccurrencePositions, int dimensions, int numberIterations) {

    int duplicateIndex = blockIdx.x;
    int firstOccurrence = firstOccurrences[duplicateIndex];
    int startWithinParameter = threadIdx.x * numberIterations;
    int startFirstOccurrenceWithinBatch = firstOccurrence * dimensions;
    int startFirstOccurrenceEntryIndex = startFirstOccurrenceWithinBatch + startWithinParameter;
    int exclusiveEndFirstOccurrenceEntryIndex = min(startFirstOccurrenceEntryIndex + numberIterations, startFirstOccurrenceWithinBatch + dimensions);
    int startOtherOccurrencePosition = otherOccurrencePositions[duplicateIndex];
    int exclusiveEndOtherOccurrencePosition = otherOccurrencePositions[duplicateIndex + 1];

    for (int otherOccurrencePosition = startOtherOccurrencePosition; otherOccurrencePosition < exclusiveEndOtherOccurrencePosition; otherOccurrencePosition++) {
        int otherOccurrence = otherOccurrences[otherOccurrencePosition];
        int otherOccurrenceEntryIndex = otherOccurrence * dimensions + startWithinParameter;

        // Use batched processing to minimize loop overhead
        for (int i = startFirstOccurrenceEntryIndex; i < exclusiveEndFirstOccurrenceEntryIndex; ++i) {
            input[i] += __ldg(&input[otherOccurrenceEntryIndex + i - startFirstOccurrenceEntryIndex]);
            input[otherOccurrenceEntryIndex + i - startFirstOccurrenceEntryIndex] = nanf("NaN");
        }
    }
}