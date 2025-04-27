#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBiggerThan(float* gMat1, float* gMat2, float* gMatTarget, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Evaluate condition and assign result within bounds check
    if (idx < numElements) {
        gMatTarget[idx] = (gMat1[idx] > gMat2[idx]) ? 1.0f : 0.0f;
    }
}