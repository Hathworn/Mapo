#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getPredicate_kernel(unsigned int * d_inVal, unsigned int * d_predVal, unsigned int numElems, unsigned int bitMask)
{
    unsigned int gIdx = blockIdx.x * blockDim.x + threadIdx.x;

    if (gIdx < numElems)
    {
        // Use bitwise AND and comparison to populate d_predVal
        d_predVal[gIdx] = (d_inVal[gIdx] & bitMask) ? 1 : 0;
    }
}