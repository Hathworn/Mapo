#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gCopyCols(float* out, const float* in, size_t rows, size_t colsIn, const size_t* sourceColIdx, size_t colsOut) {
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    if (j < rows) {
        const float* rowIn = in + j * colsIn;
        float* rowOut = out + j * colsOut;

        for (int i = threadIdx.x; i < colsOut; i += blockDim.x) {
            // Copy column value from source to destination
            rowOut[i] = rowIn[sourceColIdx[i]];
        }
    }
}