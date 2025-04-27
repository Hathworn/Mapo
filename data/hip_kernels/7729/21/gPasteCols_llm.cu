#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gPasteCols(float* out, const float* in, size_t rows, size_t colsOut, const size_t* targetColIdx, size_t colsIn) {
    int j = blockIdx.x + blockIdx.y * gridDim.x; // Calculate global row index
    while (j < rows) { // Iterate over row blocks
        const float* rowIn = in + j * colsIn;
        float* rowOut = out + j * colsOut;
        
        int i = threadIdx.x + blockIdx.z * blockDim.x; // Calculate global column index
        while(i < colsIn) { // Iterate over column blocks
            atomicAdd(&rowOut[targetColIdx[i]], rowIn[i]); // Use atomic operation to prevent race conditions
            i += blockDim.x * gridDim.z; // Move to the next column block
        }
        
        j += gridDim.x * gridDim.y; // Move to the next row block
    }
}