#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gPasteRows(float* out, const float* in, size_t cols, const size_t* targetRowIdx, size_t rows) {
    // Optimized iteration for blocks
    int j = blockIdx.x + gridDim.x * blockIdx.y;
    while (j < rows) {
        size_t dstId = targetRowIdx[j];
        size_t srcId = j;
        
        float* rowOut = out + dstId * cols;
        const float* rowIn = in + srcId * cols;

        // Optimized iteration for threads
        int i = threadIdx.x;
        while (i < cols) {
            atomicAdd(rowOut + i, rowIn[i]);
            i += blockDim.x;
        }
        
        j += gridDim.x * gridDim.y;
    }
}