#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, float* in, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Early exit for threads outside the output matrix
    if(tid >= outRows * outCols) return;

    int rowId = tid / outCols;  // Corrected columns division for rowId
    int colId = tid % outCols;  // Corrected columns modulo for colId

    // Calculate the starting pointer for input and local mask for current thread
    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Adjust width for the last column
    if(colId == outCols - 1) {
        width = lastWidth;
    }

    // Initialize maximum value calculation
    float currentMax = b[0] * localMask[0];
    for(int i = 1; i < width; ++i) {
        float product = b[i] * localMask[i];
        if(product > currentMax) {
            currentMax = product;  // Update maximum if current is greater
        }
    }

    // Output the maximum value for current thread
    out[rowId * outCols + colId] = currentMax;  // Correct index calculation for storing result
}