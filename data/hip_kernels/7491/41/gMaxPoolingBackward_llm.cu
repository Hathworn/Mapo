#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, 
                                    float* adjIn, int inRows, int inCols, float* mask, 
                                    int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Early exit for threads outside the valid range
    if (tid >= adjRows * adjCols) return;

    int rowId = tid / adjCols; // Corrected computation of rowId
    int colId = tid % adjCols; // Corrected computation of colId

    int currWidth = (colId == adjCols - 1) ? lastWidth : width; // Adjusted criteria using adjCols

    float* b = in + (rowId * inCols) + (colId * width);
    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;

    size_t currentMaxIdx = 0;

    // Loop unrolling for small fixed widths might improve performance
    for (int i = 1; i < currWidth; ++i) {
        if (b[i] * localMask[i] > b[currentMaxIdx] * localMask[currentMaxIdx]) {
            currentMaxIdx = i;
        }
    }

    // Reduce accesses to global memory
    atomicAdd(&adjIn[(rowId * inCols) + (colId * width) + currentMaxIdx], 
              adj[rowId + (colId * adjCols)]);
}