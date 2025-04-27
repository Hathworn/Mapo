#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elmsk(float *inA, float *inB, bool *msk, int length)
{
    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Unroll the loop to process two elements at a time
    for (; idx + 1 < length; idx += blockDim.x * gridDim.x * 2) {
        if (msk[idx]) 
            inA[idx] *= inB[idx];
        else 
            inA[idx] = 0;
        
        if (msk[idx + 1]) 
            inA[idx + 1] *= inB[idx + 1];
        else 
            inA[idx + 1] = 0;
    }

    // Handle the remaining element if length is odd
    if (idx < length) {
        if (msk[idx]) 
            inA[idx] *= inB[idx];
        else 
            inA[idx] = 0;
    }
}