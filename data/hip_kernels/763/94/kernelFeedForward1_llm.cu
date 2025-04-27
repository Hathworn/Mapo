#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward1(float *zs, int bound2, float *weights, int w_off, float *activations1) {
    // Calculate unique index for each thread
    int idx = threadIdx.x;

    // Initialize output
    float sum = 0.0;

    // Use loop unrolling to optimize accumulation
    int i;
    for (i = 0; i < bound2 - 3; i += 4) {
        sum += weights[w_off + (idx * bound2) + i] * activations1[i];
        sum += weights[w_off + (idx * bound2) + i + 1] * activations1[i + 1];
        sum += weights[w_off + (idx * bound2) + i + 2] * activations1[i + 2];
        sum += weights[w_off + (idx * bound2) + i + 3] * activations1[i + 3];
    }

    // Handle remaining elements if bound2 is not divisible by 4
    for (; i < bound2; i++) {
        sum += weights[w_off + (idx * bound2) + i] * activations1[i];
    }

    // Write the result back to global memory
    zs[idx] = sum;
}