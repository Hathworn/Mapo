#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, float* adjIn, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if (tid >= adjRows * adjCols)
        return;

    int rowId = tid / adjRows;
    int colId = tid % adjRows;

    // Initialize pointers to row specific data
    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Determine width for each column
    int effectiveWidth = (colId == adjRows - 1) ? lastWidth : width;

    // Initialize currentMax with the first element
    size_t currentMaxIdx = 0;
    float maxValue = b[0] * localMask[0];

    // Loop unrolling for performance
    for(int i = 1; i < effectiveWidth; ++i) {
        float tempValue = b[i] * localMask[i];
        if (tempValue > maxValue) {
            maxValue = tempValue;
            currentMaxIdx = i;
        }
    }

    // Update adjIn with corresponding adj value
    atomicAdd(&adjIn[(rowId * inCols) + (colId * width) + currentMaxIdx],
              adj[rowId + (colId * adjCols)]);
}