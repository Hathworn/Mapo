#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultiplyBySigmoidGrad(float* __restrict__ act, float* __restrict__ target, const unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    for(unsigned int i = idx; i < len; i += stride) {
        float act_val = act[i];  // Load act value once
        target[i] *= act_val * (1.0f - act_val);  // Reduce repetitive access
    }
}