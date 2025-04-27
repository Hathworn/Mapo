#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, float* adjIn, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    // Calculate unique global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check for thread ID within bounds
    if(tid >= adjRows * adjCols)
        return;

    // Calculate row and column indices
    int rowId = tid / adjCols;
    int colId = tid % adjCols;

    // Determine the width for the last row
    int currentWidth = (colId == adjRows - 1) ? lastWidth : width;

    // Pointer to the start of the current row in the input
    float* b = in + (rowId * inCols) + (colId * width);

    // Pointer to the corresponding section of the mask
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Find the index of the max element considering the mask
    size_t currentMaxIdx = 0;
    for(int i = 1; i < currentWidth; ++i) {
        if(b[i] * localMask[i] > b[currentMaxIdx] * localMask[currentMaxIdx]) {
            currentMaxIdx = i;
        }
    }

    // Update adjIn with the adjusted gradient
    adjIn[(rowId * inCols) + (colId * width) + currentMaxIdx] += adj[rowId * adjCols + colId];
}