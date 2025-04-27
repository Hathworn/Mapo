#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableSigmoid(float x) {
    if(x >= 0) {
        float z = expf(-x);
        return 1.0 / (1.0 + z);
    } else {
        float z = expf(x);
        return z / (1.0 + z);
    }
}

__global__ void gLSTMOutputForward(float* out, const float* cell, const float* xW, const float* sU, const float* b, size_t rows, size_t cols) {
    // Calculate global thread index
    int row = blockIdx.x + blockIdx.y * gridDim.x;
    int col = threadIdx.x;

    if(row < rows && col < cols) {
        int baseIndex = row * cols;
        float* rowOut = out + baseIndex;
        const float* rowCell = cell + baseIndex;

        int xWIndex = baseIndex * 4 + col + 3 * cols;
        const float* xWrow = xW + xWIndex;
        const float* sUrow = sU + xWIndex;

        float go = stableSigmoid(xWrow[0] + sUrow[0] + b[col + 3 * cols]);
        rowOut[col] = go * tanhf(rowCell[col]);
    }
}