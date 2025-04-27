#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward1b(float *zs, int bound, float *weights, int w_off, float *activations) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate the global thread index

    float z_value = 0.0f;  // Initialize accumulator for the sum
    for (int i = 0; i < bound; i++) {
        z_value += weights[w_off + (threadIdx.x * bound) + i] * activations[blockIdx.x * bound + i];
    }
    zs[idx] = z_value;  // Store computed value in zs array
}