#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void horizOrKernel(const uint32_t* __restrict__ contrib, uint32_t* __restrict__ rowHasImage, unsigned panoWidth, unsigned panoHeight) {
    unsigned row = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load input only if row is within panoHeight
    if (row < panoHeight) {
        const uint32_t* rowp = contrib + panoWidth * row;
        uint32_t accum = 0;

        // Unroll loop for better performance
        for (unsigned col = 0; col < panoWidth; col += 4) {
            accum |= rowp[col];
            if (col + 1 < panoWidth) accum |= rowp[col + 1];
            if (col + 2 < panoWidth) accum |= rowp[col + 2];
            if (col + 3 < panoWidth) accum |= rowp[col + 3];
        }
        
        // Store the accumulated result
        rowHasImage[row] = accum;
    }
}