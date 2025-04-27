#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, float* in, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if(tid >= outRows * outCols)
        return;

    int rowId = tid / outRows;
    int colId = tid % outRows;

    // Align base pointers for input and mask
    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Adjust width for the last pooling window
    if(colId == outRows - 1) {
        width = lastWidth;
    }

    float currentMax = b[0] * localMask[0];
    
    #pragma unroll 4 // Suggest compiler to unroll the loop
    for(int i = 1; i < width; ++i) {
        float val = b[i] * localMask[i];
        if(val > currentMax) {
            currentMax = val;
        }
    }

    // Write the result to the output
    out[rowId * outCols + colId] = currentMax;
}