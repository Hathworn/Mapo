#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultiplyBySigmoidGrad(float* act, float* target, const unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;  // Use 'stride' instead of 'numThreads' for clarity

    for(unsigned int i = idx; i < len; i += stride) {  // Simplified loop increment variable
        const float activation = act[i];  // Read 'act[i]' once and reuse for performance
        target[i] *= activation * (1.0f - activation);  // Directly update 'target[i]'
    }
}