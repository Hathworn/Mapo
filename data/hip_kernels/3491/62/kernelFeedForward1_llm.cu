#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward1(float *zs, int bound2, float *weights, int w_off, float *activations1) {
    // Calculate the thread ID
    int tid = threadIdx.x;

    // Initialize the result for this thread
    float sum = 0.0;

    // Use a register to accumulate the result and avoid global memory access in each iteration
    for (int i = 0; i < bound2; i++) {
        sum += weights[w_off + (tid * bound2) + i] * activations1[i];
    }

    // Write the result to global memory only once
    zs[tid] = sum;
}