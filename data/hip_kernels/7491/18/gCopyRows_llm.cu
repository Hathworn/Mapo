#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gCopyRows(float* out, const float* in, size_t cols, const size_t* sourceRowIdx, size_t rows) {
    int j = blockIdx.x + blockIdx.y * gridDim.x; // Calculate row index using 2D grid
    while (j < rows) {
        size_t dstId = j;
        size_t srcId = sourceRowIdx[j];
        float* rowOut = out + dstId * cols;
        const float* rowIn = in + srcId * cols;
        
        for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) { // Improve parallel efficiency by starting directly with threadIdx.x
            rowOut[tid] = rowIn[tid];
        }
        
        j += gridDim.x * gridDim.y; // Increment row index by 2D grid size
    }
}