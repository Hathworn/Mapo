#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, float* in, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Early exit if tid is out of bounds
    if (tid >= outRows * outCols) return;

    int rowId = tid / outCols; // Calculate correct rowId
    int colId = tid % outCols; // Calculate correct colId

    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Adjust width for the last column
    if (colId == outCols - 1) {
        width = lastWidth;
    }

    // Initialize currentMax with negative infinity to handle negative values
    float currentMax = -FLT_MAX;
    for (int i = 0; i < width; ++i) {
        float val = b[i] * localMask[i];
        if (val > currentMax) {
            currentMax = val;
        }
    }

    out[rowId * outCols + colId] = currentMax; // Correct indexing for output
}