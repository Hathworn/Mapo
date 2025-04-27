#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void eldiv0(float *inA, float *inB, int length)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < length) {
        // Use registers to hold values for faster operations
        float valA = inA[idx];
        float valB = inB[idx];
        
        inA[idx] = valA / valB;
    }
}