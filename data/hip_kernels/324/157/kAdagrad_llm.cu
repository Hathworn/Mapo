#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAdagrad(float *history, float *grad, float delta, int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for reduction if applicable, else direct index
    if (idx < len) {
        float curr_norm = history[idx] - delta;
        history[idx] = delta + sqrt(curr_norm * curr_norm + grad[idx] * grad[idx]);
    }
}