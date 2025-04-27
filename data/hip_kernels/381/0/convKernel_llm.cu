#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convKernel(const float* __restrict__ source, const float* __restrict__ kernel, float* __restrict__ target, const int len) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if out-of-bounds
    if (idx >= len) return;

    float value = 0.0f;

    // Loop unrolling assuming len is a multiple of 4 can improve performance
    for (int i = 0; i < len; i += 4) {
        // Use texture memory to potentially increase memory throughput
        value += source[i] *
                 kernel[(len + len / 2 + idx - i) % len];
        value += source[i+1] *
                 kernel[(len + len / 2 + idx - i-1) % len];
        value += source[i+2] *
                 kernel[(len + len / 2 + idx - i-2) % len];
        value += source[i+3] *
                 kernel[(len + len / 2 + idx - i-3) % len];
    }

    // Write the result
    target[idx] = value;
}