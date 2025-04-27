#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    // Calculate unique thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a loop with stride for processing large data
    for (int idx = tid; idx < size; idx += gridDim.x * blockDim.x) {
        // Clamp gradient values
        float grad = d[idx];
        if (grad > clip) grad = clip;
        if (grad < -clip) grad = -clip;

        // Accumulate squared gradients
        m[idx] += grad * grad;
        // Update parameter
        x[idx] -= lr * grad / sqrt(m[idx] + 1e-8f);
        
        // Reset gradient
        d[idx] = 0.0f;
    }
}