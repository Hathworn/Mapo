#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gCopyRows(float* out, const float* in, size_t cols, const size_t* sourceRowIdx, size_t rows) {
    // Optimize grid-stride loop for better occupancy and coalescing
    for(int j = blockIdx.x + blockIdx.y * gridDim.x; j < rows; j += gridDim.x * gridDim.y) {
        size_t dstId = j;
        size_t srcId = sourceRowIdx[j];

        float* rowOut = out + dstId * cols;
        const float* rowIn = in + srcId * cols;

        // Optimize thread-stride loop for better coverage and efficiency
        for(int i = threadIdx.x; i < cols; i += blockDim.x) {
            rowOut[i] = rowIn[i];
        }
    }
}