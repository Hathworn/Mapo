#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(uint16_t* A, const uint16_t* B, int32_t numElements)
{
    // Calculate an optimized index based on block size and grid size
    int i = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;

    // Use warp divergence optimization for boundary checking
    if (i < numElements)
    {
        A[i] += B[i];
    }
}