#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableLogit(float x) {
    if (x >= 0) {
        float z = expf(-x);
        return 1.0 / (1.0 + z);
    } else {
        float z = expf(x);
        return z / (1.0 + z);
    }
}

__global__ void gLSTMCellForward(float* out, const float* cell, const float* xW, const float* sU, const float* b, const float* mask, size_t rows, size_t cols) {
    // Calculate global and block indices
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    int i = threadIdx.x;

    if (j < rows && i < cols) {
        float m = !mask || mask[j];

        // Calculate pointers to the current row
        float* rowOut = out + j * cols;
        const float* rowCell = cell + j * cols;
        const float* xWrow = xW + j * cols * 4;
        const float* sUrow = sU + j * cols * 4;

        // Calculating gate activations
        float gf = stableLogit(xWrow[i] + sUrow[i] + b[i]);
        float gi = stableLogit(xWrow[i + cols] + sUrow[i + cols] + b[i + cols]);
        float gc = tanhf(xWrow[i + 2 * cols] + sUrow[i + 2 * cols] + b[i + 2 * cols]);

        // Calculate output
        float cout = gf * rowCell[i] + gi * gc;
        rowOut[i] = m * cout + (1 - m) * rowCell[i];
    }
}