#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convKernel(const float* __restrict__ source, const float* __restrict__ kernel, float* __restrict__ target, const int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx >= len) return;

    float value = 0.0f;

    // Unrolling the loop for better performance
    #pragma unroll 4
    for (int i = 0; i < len; i++) {
        value += source[i] * kernel[(len + len / 2 + idx - i) % len]; // Positive modulo
    }

    target[idx] = value;
}