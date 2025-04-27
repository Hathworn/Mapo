#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSoftMaxCrossEntropy(float* mat, float* labels, float* target, unsigned int width, unsigned int height, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Calculate stride outside of loop
    for (unsigned int i = idx; i < width; i += stride) {
        int labelIndex = static_cast<int>(labels[i]); // Cache label index
        float value = mat[height * i + labelIndex]; // Cache matrix value
        target[i] = -__logf(value + tiny); // Simplify calculation
    }
}