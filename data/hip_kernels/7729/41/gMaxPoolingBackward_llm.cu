#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, float* adjIn, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Return early if thread ID is out of bounds
    if(tid >= adjRows * adjCols) return;

    int rowId = tid / adjCols; // Corrected row index calculation
    int colId = tid % adjCols; // Corrected column index calculation

    float* b = in + (rowId * inCols) + (colId * width);

    // Adjust width for the last column
    width = (colId == adjCols - 1 ? lastWidth : width);
    
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;
    
    // Initialize with zero for clarity
    size_t currentMaxIdx = 0;
    float currentMaxVal = b[0] * localMask[0];
    
    // Unrolled loop for better performance (example with 4-way unrolling, adjust as needed)
    for(int i = 1; i < width; ++i) {
        float val = b[i] * localMask[i];
        if(val > currentMaxVal) {
            currentMaxIdx = i;
            currentMaxVal = val;
        }
    }

    // Atomic operation to avoid race conditions
    atomicAdd(&adjIn[(rowId * inCols) + (colId * width) + currentMaxIdx], adj[rowId + (colId * adjCols)]);
}