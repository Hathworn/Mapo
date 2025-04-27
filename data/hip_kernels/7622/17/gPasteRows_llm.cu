#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gPasteRows(float* out, const float* in, size_t cols, const size_t* targetRowIdx, size_t rows) {
    // Optimize grid stride for better use of block and threads
    for (int j = blockIdx.x; j < rows; j += gridDim.x) {
        size_t dstId = targetRowIdx[j];
        size_t srcId = j;

        float* rowOut = out + dstId * cols;
        const float* rowIn = in + srcId * cols;

        // Optimize block stride for better parallelism
        for (int i = threadIdx.x; i < cols; i += blockDim.x) {
            atomicAdd(rowOut + i, rowIn[i]);
        }
    }
}