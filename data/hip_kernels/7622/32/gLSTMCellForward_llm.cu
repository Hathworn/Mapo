#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableLogit(float x) {
    if(x >= 0) {
        float z = expf(-x);
        return 1.0 / (1.0 + z);
    } else {
        float z = expf(x);
        return z / (1.0 + z);
    }
}

__global__ void gLSTMCellForward(float* out, const float* cell, const float* xW, const float* sU, const float* b, const float* mask, size_t rows, size_t cols) {
    // Use 2D grid to handle rows and columns simultaneously
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < rows && col < cols) {
        float m = !mask || mask[row];

        float* rowOut = out + row * cols;
        const float* rowCell = cell + row * cols;

        const float* xWrow = xW + row * cols * 4;
        const float* sUrow = sU + row * cols * 4;

        // Fetch weights and biases preemptively
        float b_i = b[col];
        float xWrow_i = xWrow[col];
        float sUrow_i = sUrow[col];

        float gf = stableLogit(xWrow_i + sUrow_i + b_i);

        int k = col + cols;
        float gi = stableLogit(xWrow[k] + sUrow[k] + b[k]);

        int l = col + 2 * cols;
        float gc = tanhf(xWrow[l] + sUrow[l] + b[l]);

        float cout = gf * rowCell[col] + gi * gc;
        rowOut[col] = m * cout + (1 - m) * rowCell[col];
    }
}