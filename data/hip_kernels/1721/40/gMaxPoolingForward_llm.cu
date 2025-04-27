#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, float* in, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize: Check valid thread index
    if(tid >= outRows * outCols)
        return;

    int rowId = tid / outCols; // Corrected to use outCols for rowId calculation
    int colId = tid % outCols; // Corrected to use outCols for colId calculation

    // Adjust pointers for input and mask
    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Use "width" directly within the loop instead of checking conditionally.
    if(colId == outCols - 1) {
        width = lastWidth; // Obtain last width for the last column
    }

    // Initialize maximum value
    float currentMax = -FLT_MAX; // Use negative float max for comparison

    // Optimize: Loop unrolling
    for(int i = 0; i < width; ++i) {
        // Calculate and compare product in one step
        float product = b[i] * localMask[i];
        if(product > currentMax) {
            currentMax = product;
        }
    }

    // Write the result into the output
    out[rowId * outCols + colId] = currentMax; // Ensure correct output index calculation
}