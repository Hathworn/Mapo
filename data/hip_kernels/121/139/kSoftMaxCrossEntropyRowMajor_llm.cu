#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxCrossEntropyRowMajor(float* mat, float* labels, float* target, unsigned int width, unsigned int height, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Iterate over rows this thread is responsible for
    for (unsigned int i = idx; i < height; i += stride) {
        int label_idx = height * static_cast<int>(labels[i]) + i;
        float mat_val = mat[label_idx];
        
        // Efficient calculation with prefetching the matrix value
        target[i] = -__logf(mat_val + tiny);
    }
}