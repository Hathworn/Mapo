#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gPasteCols(float* out, const float* in, size_t rows, size_t colsOut, const size_t* targetColIdx, size_t colsIn) {
    int j = blockIdx.x + blockIdx.y * gridDim.x; // Calculate global row index
    if(j < rows) {
        const float* rowIn = in + j * colsIn;
        float* rowOut = out + j * colsOut;

        for(int tid = threadIdx.x; tid < colsIn; tid += blockDim.x) { // Optimize by eliminating extra outer loop
            if(tid < colsIn) {
                rowOut[targetColIdx[tid]] = rowIn[tid]; // Map input column to target output column
            }
        }
    }
}