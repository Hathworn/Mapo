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

__global__ void gLSTMCellForward(float* out, const float* cell, const float* xW, const float* sU, const float* b, const float* mask, size_t rows, size_t cols) {
    // Calculate the row index this block is going to work with
    int j = blockIdx.x * blockDim.y + threadIdx.y;
    if(j < rows) {
        float m = !mask || mask[j];
        
        float* rowOut = out + j * cols;
        const float* rowCell = cell + j * cols;

        const float* xWrow = xW + j * cols * 4;
        const float* sUrow = sU + j * cols * 4;

        // Use shared memory to improve memory access efficiency
        extern __shared__ float sharedMemory[];
        float* shared_xW = sharedMemory;
        float* shared_sU = sharedMemory + cols;
        float* shared_b = sharedMemory + 2 * cols;

        for(int i = threadIdx.x; i < cols; i += blockDim.x) {
            shared_b[i] = b[i];
        }
        __syncthreads();

        for(int i = threadIdx.x; i < cols; i += blockDim.x) {
            float gf = stableSigmoid(xWrow[i] + sUrow[i] + shared_b[i]);

            int k = i + cols;
            float gi = stableSigmoid(xWrow[k] + sUrow[k] + shared_b[k]);

            int l = i + 2 * cols;
            float gc = tanhf(xWrow[l] + sUrow[l] + shared_b[l]);

            float cout = gf * rowCell[i] + gi * gc;
            rowOut[i] = m * cout + (1 - m) * rowCell[i];
        }
    }
}