#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kRMSProp(float *history, float *grad, float factor, int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    for (unsigned int i = idx; i < len; i += numThreads) {
        // Optimize repetitive calculations by precomputing reused terms
        float history_i = history[i];
        float grad_i = grad[i];
        float updated_value = factor * history_i * history_i + (1 - factor) * grad_i * grad_i;
        history[i] = sqrt(updated_value);
    }
}