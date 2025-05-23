#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, float* adjIn, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    if(tid >= adjRows * adjCols)
        return;

    int rowId = tid / adjRows;
    int colId = tid % adjRows;
    
    float* b = in + (rowId * inCols) + (colId * width);
    if(colId == adjRows - 1) {
        width = lastWidth;
    }
    
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;
    size_t currentMaxIdx = 0;
    float maxVal = b[0] * localMask[0]; // Initialize maxVal

    // Unroll the loop for better performance in small width cases
    for(int i = 1; i < width; ++i) {
        float val = b[i] * localMask[i];
        if(val > maxVal) {
            maxVal = val;
            currentMaxIdx = i;
        }
    }

    // Atomic operation for updates to handle concurrent writes
    atomicAdd(&adjIn[(rowId * inCols) + (colId * width) + currentMaxIdx], adj[rowId + (colId * adjCols)]);
}