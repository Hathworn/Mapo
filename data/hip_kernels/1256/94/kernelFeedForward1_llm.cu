#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelFeedForward1(float *zs, int bound2, float *weights, int w_off, float *activations1) {
    int tx = threadIdx.x;

    // Initialize zs to 0 for the current thread
    float z_value = 0.0f;

    // Use a pointer for weights to avoid calculating the offset multiple times
    float* weight_ptr = weights + w_off + (tx * bound2);

    // Accumulate the weighted sum
    for (int i = 0; i < bound2; i++) {
        z_value += weight_ptr[i] * activations1[i];
    }

    // Store the result in zs
    zs[tx] = z_value;
}