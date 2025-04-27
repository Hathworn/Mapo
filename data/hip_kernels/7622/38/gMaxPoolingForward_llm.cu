#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingForward(float* out, int outRows, int outCols, const float* in, int inRows, int inCols, const float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if(tid >= outRows * outCols)
        return;

    // Compute row and column indices
    int rowId = tid / outCols;  // Fix division by outCols
    int colId = tid % outCols;

    const float* b = in + (rowId * inCols) + (colId * width);
    const float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    // Adjust width for the last column
    int effectiveWidth = (colId == outCols - 1) ? lastWidth : width;

    // Initialize with first element's product
    float currentMax = b[0] * localMask[0];
    
    // Unroll loop to reduce iteration overhead
    #pragma unroll
    for(int i = 1; i < effectiveWidth; ++i) {
        float candidate = b[i] * localMask[i];
        if(candidate > currentMax) {
            currentMax = candidate;
        }
    }
    
    out[rowId + (colId * outCols)] = currentMax;
}