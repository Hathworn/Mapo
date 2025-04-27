#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, float* adjIn, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Early exit if thread ID is beyond the bounds
    if(tid >= adjRows * adjCols)
        return;

    // Calculate row and column indices
    int rowId = tid / adjCols; // Correcting column stride to adjCols
    int colId = tid % adjCols; // Correcting column stride to adjCols

    float* b = in + rowId * inCols + colId * width;

    // Adjust width for the last segment
    if(colId == adjCols - 1) { // Correct the comparison to adjCols
        width = lastWidth;
    }

    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;
    
    // Find max index more efficiently
    size_t currentMaxIdx = 0;
    float currentMaxValue = b[0] * localMask[0]; // Start comparison from the first element
    
    for(int i = 1; i < width; ++i) {
        float maskedValue = b[i] * localMask[i];
        if(maskedValue > currentMaxValue) {
            currentMaxIdx = i;
            currentMaxValue = maskedValue;
        }
    }

    // Update the corresponding index in adjIn
    atomicAdd(&adjIn[rowId * inCols + colId * width + currentMaxIdx], adj[rowId * adjCols + colId]); // Use atomic add for potential race conditions
}