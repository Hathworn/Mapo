#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThanEq(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate global index for the current thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to ensure all elements are covered by the threads
    for (unsigned int i = idx; i < len; i += gridDim.x * blockDim.x) {
        // Perform the comparison and store it directly
        target[i] = mat1[i] >= mat2[i];
    }
}