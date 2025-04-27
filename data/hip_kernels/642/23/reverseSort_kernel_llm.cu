#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reverseSort_kernel(unsigned int * d_newArray, unsigned int * d_oldArray, unsigned int numElems)
{
    unsigned int gIdx = blockIdx.x * blockDim.x + threadIdx.x;
    if (gIdx < numElems)
    {
        // Efficient calculation by using shared memory for data caching
        unsigned int reverseIdx = numElems - 1 - gIdx;
        __shared__ unsigned int s_oldArray[numElems];
        s_oldArray[gIdx] = d_oldArray[gIdx];
        __syncthreads();
        d_newArray[gIdx] = s_oldArray[reverseIdx];
    }
}