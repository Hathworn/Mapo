#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multi(float *a, float *b, float *c, int width) {
    // Calculate global thread row and column
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    float result = 0;

    // Check if within matrix bounds
    if (col < width && row < width) {
        // Loop unrolling for better performance
        #pragma unroll
        for (int k = 0; k < width; k++) {
            result += a[row * width + k] * b[k * width + col];
        }
        // Store the computed result
        c[row * width + col] = result;
    }
}