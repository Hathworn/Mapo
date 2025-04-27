#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableLogit(float x) {
    if(x >= 0) {
        float z = expf(-x);
        return 1.0f / (1.0f + z);
    } else {
        float z = expf(x);
        return z / (1.0f + z);
    }
}

__global__ void gLSTMOutputForward(float* out, const float* cell, const float* xW, const float* sU, const float* b, size_t rows, size_t cols) {
    int j = blockIdx.x + blockIdx.y * gridDim.x;  // Compute global row index
    if(j < rows) {
        float* rowOut = out + j * cols;
        const float* rowCell = cell + j * cols;
        const float* xWrow = xW + j * cols * 4;
        const float* sUrow = sU + j * cols * 4;

        int i = threadIdx.x + blockIdx.y * blockDim.x;  // Compute global column index
        while(i < cols) {  // Use a while loop to cover all elements along the row
            int k = i + 3 * cols;
            float go = stableLogit(xWrow[k] + sUrow[k] + b[k]);
            rowOut[i] = go * tanhf(rowCell[i]);
            i += blockDim.x * gridDim.x;  // Move to the next column index
        }
    }
}