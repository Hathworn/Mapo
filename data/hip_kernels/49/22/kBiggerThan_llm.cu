#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBiggerThan(float* gMat1, float* gMat2, float* gMatTarget, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Add grid-stride loop to process more elements if necessary
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        gMatTarget[i] = gMat1[i] > gMat2[i];
    }
}