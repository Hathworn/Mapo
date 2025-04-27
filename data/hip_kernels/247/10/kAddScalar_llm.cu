#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;  // Calculate stride

    for (unsigned int i = idx; i < numElements; i += stride) {
        target[i] = scalar + gData[i];
    }
}