#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gCopyCols(float* out, const float* in, size_t rows, size_t colsIn, const size_t* sourceColIdx, size_t colsOut) {
    int j = blockIdx.x + blockIdx.y * gridDim.x; // Better 2D grid launch for large rows
    if (j < rows) {
        const float* rowIn = in + j * colsIn;
        float* rowOut = out + j * colsOut;

        for (int tid = threadIdx.x; tid < colsOut; tid += blockDim.x) { // Start thread loop with threadIdx
            rowOut[tid] = rowIn[sourceColIdx[tid]];
        }
    }
}