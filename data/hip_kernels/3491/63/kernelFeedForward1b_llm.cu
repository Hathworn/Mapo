```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward1b(float *zs, int bound, float *weights, int w_off, float *activations) {
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;
    float sum = 0.0f; // Accumulator for the output

    // Loop unrolling for improved performance
    for (int i = 0; i < bound; i += 4) {
        sum += weights[w_off + (threadIdx.x * bound) + i] * activations[(blockIdx.x * bound) + i];
        if (i + 1 < bound) sum += weights[w_off + (threadIdx.x * bound) + i + 1] * activations[(blockIdx.x * bound) + i + 1];
        if (i + 2 < bound) sum += weights[w_off + (threadIdx.x * bound) + i + 2] * activations[(blockIdx.x * bound) + i + 2];
        if (i + 3 < bound) sum += weights[w_off + (threadIdx.x * bound) + i + 3] * activations[(blockIdx.x * bound) + i + 3];
    }

    zs[idx] = sum; // Save result back to global memory
}