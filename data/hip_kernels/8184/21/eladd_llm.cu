#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void eladd(float * inA, float * inB, int length)
{
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Use grid-stride loop to handle more elements beyond a single block
    for (; idx < length; idx += blockDim.x * gridDim.x)
    {
        inA[idx] += inB[idx];
    }
}