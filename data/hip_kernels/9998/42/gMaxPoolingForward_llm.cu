#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, float* in, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if(tid >= outRows * outCols) return; // Boundary check

    int rowId = tid / outCols; // Correct rowId calculation
    int colId = tid % outCols; // Correct colId calculation

    // Pointer to current input block
    float* b = in + (rowId * inCols) + (colId * width); 
    // Pointer to relevant mask block
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    if(colId == outCols - 1) {
        width = lastWidth; // Adjust width for the last column
    }

    // Initialize max with first element
    float currentMax = b[0] * localMask[0];
    for(int i = 1; i < width; ++i) {
        float maskedValue = b[i] * localMask[i]; // Compute only once
        if(maskedValue > currentMax) {
            currentMax = maskedValue;
        }
    }

    // Store the result in the proper position
    out[rowId * outCols + colId] = currentMax;
}