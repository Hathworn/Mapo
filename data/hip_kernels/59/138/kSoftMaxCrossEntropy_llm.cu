#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxCrossEntropy(float* mat, float* labels, float* target, unsigned int width, unsigned int height, float tiny) {
    // Use shared memory for improved memory access efficiency
    extern __shared__ float sharedData[];
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    for (unsigned int i = idx; i < width; i += numThreads) {
        float label_value = labels[i];
        // Pre-fetch required data into shared memory
        float mat_value = mat[height * i + (int)label_value];
        target[i] = -__logf(mat_value + tiny);
    }
}