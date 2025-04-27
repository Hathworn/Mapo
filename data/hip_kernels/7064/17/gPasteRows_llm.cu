#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gPasteRows(float* out, const float* in, size_t cols, const size_t* targetRowIdx, size_t rows) {
    // Calculate the global row index handled by this block
    int j = blockIdx.x + gridDim.x * blockIdx.y;
    if(j < rows) {
        size_t dstId = targetRowIdx[j];
        size_t srcId = j;

        float* rowOut = out + dstId * cols;
        const float* rowIn = in + srcId * cols;

        // Use a single loop to handle row copying with atomicAdd
        for(int i = threadIdx.x; i < cols; i += blockDim.x) {
            atomicAdd(rowOut + i, rowIn[i]);
        }
    }
}