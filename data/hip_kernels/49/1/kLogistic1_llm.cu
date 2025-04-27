#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogistic1(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    // Unroll the loop to improve performance
    for (unsigned int i = idx; i < numElements; i += stride) {
        target[i] = (1 + tanhf(gData[i] / 2)) / 2;
    }
}