#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convdx_gpu_kernel(float *dx, float *dy, float *weights, const int S, const int outSize, const int inSize) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if we are within bounds
    if (row < inSize && col < outSize) {
        float sum = 0.0f;  // Accumulate result in a local variable

        // Loop unrolling for improved performance
        for (int i = 0; i < S; i += 4) {
            if (i + 0 < S) sum += dy[row * S + (i + 0)] * weights[col * S + (i + 0)];
            if (i + 1 < S) sum += dy[row * S + (i + 1)] * weights[col * S + (i + 1)];
            if (i + 2 < S) sum += dy[row * S + (i + 2)] * weights[col * S + (i + 2)];
            if (i + 3 < S) sum += dy[row * S + (i + 3)] * weights[col * S + (i + 3)];
        }

        dx[row * outSize + col] = sum;  // Write result to output
    }
}