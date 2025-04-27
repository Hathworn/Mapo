#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultiplyBySigmoidGrad(float* act, float* target, const unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use strided loop with less calculations
    while (idx < len) {
        float act_val = act[idx]; // Cache act value
        target[idx] *= act_val * (1.0f - act_val);
        idx += blockDim.x * gridDim.x;
    }
}