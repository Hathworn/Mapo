#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxCrossEntropyRowMajor(float* mat, float* labels, float* target, unsigned int width, unsigned int height, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Loop unrolling for better memory access and reduced loop overhead
    for (unsigned int i = idx; i < height; i += numThreads) {
        // Compute target element using more efficient indexing
        unsigned int label_idx = static_cast<int>(labels[i]);
        unsigned int mat_idx = height * label_idx + i;
        
        target[i] = -__logf(mat[mat_idx] + tiny);
    }
}