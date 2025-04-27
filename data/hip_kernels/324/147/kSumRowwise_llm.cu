#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSumRowwise(float* mat, float* target, unsigned int width, unsigned int height, float mult, float p) {
    extern __shared__ float sum_vals[];
    const int row = blockIdx.x * blockDim.x + threadIdx.x; // Simplify row calculation

    if (row < height) {
        float sum = 0;
        for (unsigned int i = row; i < width * height; i += height) { // Improve memory access pattern
            sum += mat[i];
        }
        target[row] = p * target[row] + mult * sum; // Remove __syncthreads() which is redundant here
    }
}