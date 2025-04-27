#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fc_gpu_kernel(float *y, float *x, float *weights, const int weightHeight, const int outSize, const int inSize) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < inSize && col < outSize) {
        float acc = 0;  // Use an accumulator to avoid repeated memory access
        for (int i = 0; i < weightHeight; ++i) {
            acc += x[row * weightHeight + i] * weights[i * outSize + col];
        }
        y[row * outSize + col] = acc;
    }
}