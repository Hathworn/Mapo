#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSqrt(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < numElements) { // Optimize: Check boundary condition early
        target[idx] = sqrtf(gData[idx]);
    }
}