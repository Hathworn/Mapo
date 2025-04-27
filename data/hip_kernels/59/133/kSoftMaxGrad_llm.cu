#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGrad(float* mat, float* labels, float* target, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Use stride to access elements

    for (unsigned int i = idx; i < width * height; i += stride) {
        // Efficiently compute softmax gradient
        target[i] = mat[i] - ((int)labels[i / height] == i % height ? 1.0f : 0.0f);
    }
}