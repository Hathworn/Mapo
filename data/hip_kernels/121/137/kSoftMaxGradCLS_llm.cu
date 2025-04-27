#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGradCLS(float* mat, int* labels, float* indices, float* target, unsigned int width, unsigned int height) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for frequently accessed data
    __shared__ int shared_labels[1024];  // Adjust size if needed

    // Load labels into shared memory
    if (threadIdx.x < height) {
        shared_labels[threadIdx.x] = labels[threadIdx.x];
    }
    __syncthreads();

    // Unroll loop for better performance
    for (unsigned int i = idx; i < width * height; i += blockDim.x * gridDim.x) {
        // Compute target using shared memory for labels
        target[i] = mat[i] - (shared_labels[(int)indices[i % height]] == i / height ? 1.0f : 0.0f);
    }
}