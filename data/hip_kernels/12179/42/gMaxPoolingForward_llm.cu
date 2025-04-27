#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, float* in, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if (tid >= outRows * outCols)
        return;

    int rowId = tid / outCols; // Fixed: Correct column indexing
    int colId = tid % outCols; // Fixed: Correct row indexing

    if (colId == outRows - 1) {
        width = lastWidth;
    }

    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    float currentMax = -INFINITY; // Optimization: Initialize with negative infinity
    for (int i = 0; i < width; ++i) {
        float val = b[i] * localMask[i];
        if (val > currentMax) {
            currentMax = val;
        }
    }

    out[tid] = currentMax; // Fixed: Use `tid` to index output directly
}