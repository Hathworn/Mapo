#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gPasteCols(float* out, const float* in, size_t rows, size_t colsOut, const size_t* targetColIdx, size_t colsIn) {
    // Calculate global thread index for row processing
    int j = blockIdx.x * blockDim.y + threadIdx.y;
    if (j < rows) {
        const float* rowIn = in + j * colsIn;
        float* rowOut = out + j * colsOut;
        
        // Calculate global thread index for column processing
        for (int i = threadIdx.x; i < colsIn; i += blockDim.x) {
            rowOut[targetColIdx[i]] = rowIn[i]; // Map input columns to output using target indices
        }
    }
}