#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kSigmoid kernel function using shared memory
__global__ void kSigmoid(const int nThreads, const float *input, float *output) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global thread index
    if (idx < nThreads) { // Ensure idx is within the valid range
        output[idx] = 1.0f / (1.0f + expf(-input[idx])); // Use expf for better performance
    }
}