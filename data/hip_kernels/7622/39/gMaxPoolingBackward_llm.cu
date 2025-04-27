#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, float* adjIn, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Exit early if thread index exceeds total output elements
    if(tid >= adjRows * adjCols) return;

    int rowId = tid / adjRows;
    int colId = tid % adjRows;

    // Calculate input start position for the current thread's output element
    float* b = in + (rowId * inCols) + (colId * width);

    // Adjust width for the last partition
    if(colId == adjRows - 1) {
        width = lastWidth;
    }

    // Calculate localMask start position
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;
    size_t currentMaxIdx = 0;

    // Find the index of the maximum value multiplied by mask in the current window
    for(int i = 1; i < width; ++i) {
        if(b[i] * localMask[i] > b[currentMaxIdx] * localMask[currentMaxIdx]) {
            currentMaxIdx = i;
        }
    }

    // Safely update the adjIn array using atomic operation
    atomicAdd(&adjIn[(rowId * inCols) + (colId * width) + currentMaxIdx],
              adj[rowId + (colId * adjCols)]);
}