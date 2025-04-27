#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kBiggerThanScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    // Calculate global index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for improved parallel execution
    for (; idx < numElements; idx += blockDim.x * gridDim.x) {
        target[idx] = gData[idx] > scalar;
    }
}