#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxCrossEntropy(float* mat, float* labels, float* target, unsigned int width, unsigned int height, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int gridStride = blockDim.x * gridDim.x;
    
    // Loop with grid-stride to efficiently utilize all threads
    for (unsigned int i = idx; i < width; i += gridStride) {
        int labelIdx = height * i + static_cast<int>(labels[i]);
        target[i] = -__logf(mat[labelIdx] + tiny); // Ensure label index computation only once
    }
}