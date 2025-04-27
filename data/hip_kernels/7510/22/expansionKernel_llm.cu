#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expansionKernel( int batchSize, float* input, int* inputLengths, int numberRows, int numberInputEntries, int numberFilterRowPositions, int filterHeight, int filterWidth, int filterLength, int numberResultEntries, float* result, int* resultLengths) {

    int indexInstance = blockIdx.x;
    int indexConvolution = blockIdx.y;
    int indexConvolutionEntry = threadIdx.x;

    int firstColumnOfConvolution = indexConvolution / numberFilterRowPositions;
    int firstRowOfConvolution = indexConvolution % numberFilterRowPositions;

    int relativeIndexColumn = indexConvolutionEntry / filterHeight;
    int relativeIndexRow = indexConvolutionEntry % filterHeight;

    int indexColumn = firstColumnOfConvolution + relativeIndexColumn;
    int indexRow = firstRowOfConvolution + relativeIndexRow;

    int indexEntryWithinResult = indexInstance * numberResultEntries + indexConvolution * filterLength + indexConvolutionEntry;

    if(indexInstance < batchSize) {
        int inputLength = inputLengths[indexInstance];

        // Calculating number of convolutions inline and directly using it
        int numberConvolutions = (inputLength - filterWidth + 1) * numberFilterRowPositions;

        if(indexConvolution < numberConvolutions) {
            result[indexEntryWithinResult] = input[indexInstance * numberInputEntries + indexColumn * numberRows + indexRow];
        } else {
            result[indexEntryWithinResult] = 0.0f; // Using float literal for better type consistency
        }

        // Single thread responsible for setting result lengths
        if(indexConvolution == 0 && indexConvolutionEntry == 0) {
            resultLengths[indexInstance] = numberConvolutions;
        }
    } else {
        result[indexEntryWithinResult] = nanf("NaN"); // NaN assignment unchanged
        // Avoid setting resultLengths for out of range indexInstance
    }
}