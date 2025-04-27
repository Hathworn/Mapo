#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableSigmoid(float x) {
    if (x >= 0) {
        float z = expf(-x);
        return 1.0 / (1.0 + z);
    } else {
        float z = expf(x);
        return z / (1.0 + z);
    }
}

__global__ void gLSTMCellForward(float* out, const float* cell, const float* xW, const float* sU, const float* b, const float* mask, size_t rows, size_t cols) {
    // Calculate global row index
    int j = blockIdx.x + blockIdx.y * gridDim.x; // Use 2D grid for better distribution

    if (j < rows) {
        float m = !mask || mask[j];
        float* rowOut = out + j * cols;
        const float* rowCell = cell + j * cols;
        const float* xWrow = xW + j * cols * 4;
        const float* sUrow = sU + j * cols * 4;

        for (int i = threadIdx.x; i < cols; i += blockDim.x) { // Loop unrolling potential for better efficiency
            float gf = stableSigmoid(xWrow[i] + sUrow[i] + b[i]);
        
            int k = i + cols;
            float gi = stableSigmoid(xWrow[k] + sUrow[k] + b[k]);
        
            int l = i + 2 * cols;
            float gc = tanhf(xWrow[l] + sUrow[l] + b[l]);
        
            float cout = gf * rowCell[i] + gi * gc;
            rowOut[i] = m * cout + (1 - m) * rowCell[i];
        }
    }
}