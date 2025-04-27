#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gPasteCols(float* out, const float* in, size_t rows, size_t colsOut, const size_t* targetColIdx, size_t colsIn) {
    // Utilize grid-stride loop for better parallelism over rows
    for(int j = blockIdx.x + blockIdx.y * gridDim.x; j < rows; j += gridDim.x * gridDim.y) {
        const float* rowIn = in + j * colsIn;
        float* rowOut = out + j * colsOut;

        // Utilize grid-stride loop for column processing
        for(int i = threadIdx.x; i < colsIn; i += blockDim.x) {
            if(i < colsIn) {
                rowOut[targetColIdx[i]] += rowIn[i];
            }
        }
    }
}