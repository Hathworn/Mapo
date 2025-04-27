#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSqrt(float* gData, float* target, unsigned int numElements) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for better utilization of threads
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        target[i] = sqrtf(gData[i]);
    }
}