#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRMSProp(float *history, float *grad, float factor, int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    // Compute frequently used value once per thread
    const float adjustedFactor = sqrt(factor);
    for (unsigned int i = idx; i < len; i += numThreads) {
        float h = history[i];
        float g = grad[i];
        // Simplified the computation by reducing repeated work
        history[i] = adjustedFactor * sqrt(h * h + ((1 - factor) / factor) * g * g);
    }
}