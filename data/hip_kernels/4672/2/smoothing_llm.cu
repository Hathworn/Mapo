#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smoothing(float* input, float* output, double alpha, double beta, int length) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Reorder for readability
    int j = i << 1; // Same as multiplying by 2
    if (j < length) {
        float in_j = input[j];      // Load input once
        float in_j1 = input[j+1];   // Load input once
        float out_j = output[j];    // Load output once
        float out_j1 = output[j+1]; // Load output once

        // Optimized calculation and store
        output[j] = (in_j * (1.0f + alpha) - out_j * alpha);
        output[j+1] = (in_j1 * (1.0f + beta) - out_j1 * beta);
    }
}