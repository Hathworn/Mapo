#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSubtractFromScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    // Use stride loop optimization for efficient memory access
    for (unsigned int i = idx; i < numElements; i += stride) {
        target[i] = scalar - gData[i];
    }
}