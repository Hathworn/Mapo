#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void incSumScanB2_kernel(unsigned int* d_outVals, unsigned int* d_inVals, size_t numVals, unsigned int* d_blockOffset) {
    unsigned int gIdx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit if index is out of bounds
    if (gIdx >= numVals) return;
    
    // Perform a conditional addition using ternary operator for clarity and efficiency
    unsigned int offset = (blockIdx.x > 0) ? d_blockOffset[blockIdx.x] : 0;
    d_outVals[gIdx] = d_inVals[gIdx] + offset;
}