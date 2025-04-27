#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdagrad(float *history, float *grad, float delta, int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Ensure index is within bounds and use strided loop
    for (unsigned int i = idx; i < len; i += stride) {
        float curr_norm = history[i] - delta;
        // Reduce redundant computation and combine operations for better ILP
        float grad_val = grad[i];
        history[i] = sqrt(curr_norm * curr_norm + grad_val * grad_val) + delta;
    }
}