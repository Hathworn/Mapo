#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kBiggerThan(float* __restrict__ gMat1, float* __restrict__ gMat2, float* __restrict__ gMatTarget, unsigned int numElements) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds and perform computation
    if (idx < numElements) {
        gMatTarget[idx] = gMat1[idx] > gMat2[idx];
    }
}