#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, float* adjIn, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if (tid >= adjRows * adjCols)
        return;

    // Calculate row and column index for simplicity
    int rowId = tid / adjRows;
    int colId = tid % adjRows;

    int currentWidth = (colId == adjRows - 1) ? lastWidth : width;  // Use lastWidth if at the last column

    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Initialize currentMaxIdx for finding the maximum value
    size_t currentMaxIdx = 0;
    float maxVal = b[0] * localMask[0];
    for (int i = 1; i < currentWidth; ++i) {
        float val = b[i] * localMask[i];
        if (val > maxVal) {
            maxVal = val;
            currentMaxIdx = i;
        }
    }

    // Use atomic addition to prevent race conditions
    atomicAdd(&adjIn[(rowId * inCols) + (colId * width) + currentMaxIdx],
              adj[rowId + (colId * adjCols)]);
}