#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxCrossEntropyRowMajor(float* mat, float* labels, float* target, unsigned int width, unsigned int height, float tiny) {
    // Calculate the global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Use a variable for stride

    // Loop with stride for better memory access pattern
    for (unsigned int i = idx; i < height; i += stride) {
        int label_index = static_cast<int>(labels[i]); // Use static_cast for clarity and type safety
        target[i] = -__logf(mat[height * label_index + i] + tiny); // Precompute label index
    }
}