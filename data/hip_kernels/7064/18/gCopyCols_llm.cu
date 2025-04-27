#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gCopyCols(float* out, const float* in, size_t rows, size_t colsIn, const size_t* sourceColIdx, size_t colsOut) {
    // Calculate the initial row and column index based on grid and block size
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    int i = threadIdx.x;

    // Loop over rows in a coalesced manner
    while (j < rows) {
        const float* rowIn = in + j * colsIn;
        float* rowOut = out + j * colsOut;

        // Loop over columns using threads
        while (i < colsOut) {
            rowOut[i] = rowIn[sourceColIdx[i]];
            i += blockDim.x; // Move thread id to next stride
        }
        
        j += gridDim.x * gridDim.y; // Move block id to next stride
    }
}