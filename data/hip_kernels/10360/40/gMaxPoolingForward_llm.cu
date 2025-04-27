#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, float* in, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if (tid >= outRows * outCols)
        return;

    int rowId = tid / outCols; // Corrected calculation to match outCols
    int colId = tid % outCols; // Corrected calculation to match outCols

    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    if (colId == outCols - 1) { // Corrected check to match outCols
        width = lastWidth;
    }

    float currentMax = -FLT_MAX; // Initialize with negative infinity for robustness
    for (int i = 0; i < width; ++i) { // Start from 0 for correct comparison
        float val = b[i] * localMask[i]; // Calculate once per iteration
        if (val > currentMax) {
            currentMax = val;
        }
    }

    out[rowId * outCols + colId] = currentMax; // Corrected indexing for correct placement
}