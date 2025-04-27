#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogistic2(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < numElements) { // Check to prevent out-of-bound access
        target[idx] = 1 / (1 + expf(-gData[idx]));
    }
}