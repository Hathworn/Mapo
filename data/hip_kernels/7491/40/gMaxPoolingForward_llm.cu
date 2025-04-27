#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, float* in, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if(tid >= outRows * outCols)
        return;

    int rowId = tid / outCols;  // Correct calculation for rowId using outCols
    int colId = tid % outCols;  // Correct calculation for colId using outCols

    // Calculate starting position in the input matrix and mask
    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Adjust width for last row
    if(colId == outCols - 1) {
        width = lastWidth;
    }

    float currentMax = b[0] * localMask[0];
    for(int i = 1; i < width; ++i) {
        float product = b[i] * localMask[i];
        if(product > currentMax) {
            currentMax = product;
        }
    }

    out[rowId * outCols + colId] = currentMax;  // Correct output index calculation
}