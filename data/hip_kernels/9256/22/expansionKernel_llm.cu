#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void expansionKernel( int batchSize, float* input, int* inputLengths, int numberRows, int numberInputEntries, int numberFilterRowPositions, int filterHeight, int filterWidth, int filterLength, int numberResultEntries, float* result, int* resultLengths) {

    int indexInstance = blockIdx.x;
    int indexConvolution = blockIdx.y;
    int indexConvolutionEntry = threadIdx.x;

    // Precompute reused values
    int firstColumnOfConvolution = indexConvolution / numberFilterRowPositions;
    int firstRowOfConvolution = indexConvolution % numberFilterRowPositions;

    int relativeIndexColumn = indexConvolutionEntry / filterHeight;
    int relativeIndexRow = indexConvolutionEntry % filterHeight;

    int indexColumn = firstColumnOfConvolution + relativeIndexColumn;
    int indexRow = firstRowOfConvolution + relativeIndexRow;

    // Precompute index for result
    int indexEntryWithinResult = indexInstance * numberResultEntries + indexConvolution * filterLength + indexConvolutionEntry;

    if (indexInstance < batchSize) {
        int inputLength = inputLengths[indexInstance];
        int numberConvolutions = (inputLength - filterWidth + 1) * numberFilterRowPositions;

        if (indexConvolution < numberConvolutions) {
            // Efficiently use shared memory prefetch
            result[indexEntryWithinResult] = input[indexInstance * numberInputEntries + indexColumn * numberRows + indexRow];
        } else {
            result[indexEntryWithinResult] = 0.0;
        }

        // Use thread 0 to set resultLengths
        if (indexConvolutionEntry == 0 && indexConvolution == 0) {
            resultLengths[indexInstance] = numberConvolutions;
        }
    } else {
        result[indexEntryWithinResult] = nanf("NaN");
        resultLengths[indexInstance] = 0;
    }
}