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
    int j = blockIdx.x + blockIdx.y * gridDim.x;  // Calculate row index
    if (j < rows) {
        float* rowOut = out + j * cols;
        const float* rowCell = cell + j * cols;
        const float* xWrow = xW + j * cols * 4;
        const float* sUrow = sU + j * cols * 4;

        int i = threadIdx.x;  // Simplify thread indexing
        if (i < cols) {
            int k = i + 3 * cols;  // Efficient index calculation
            float go = stableSigmoid(xWrow[k] + sUrow[k] + b[k]);
            rowOut[i] = go * tanhf(rowCell[i]);
        }
    }
}