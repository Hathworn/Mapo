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

__global__ void gLSTMCellBackward(float* outCell, float* outXW, float* outSU, float* outB, const float* cell, const float* xW, const float* sU, const float* b, const float* mask, const float* adj, size_t rows, size_t cols) {
    // Pre-compute indices to improve warp efficiency
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stepRow = gridDim.x * blockDim.x;
    int stepCol = blockDim.x;

    for(int j = tid; j < rows; j += stepRow) {
        float m = !mask || mask[j]; // Mask condition computed outside loop

        float* rowOutCell = outCell + j * cols;
        float* rowOutXW = outXW + j * cols * 4;
        float* rowOutSU = outSU + j * cols * 4;

        const float* rowCell = cell + j * cols;
        const float* xWrow = xW + j * cols * 4;
        const float* sUrow = sU + j * cols * 4;
        const float* rowAdj = adj + j * cols;

        for(int i = threadIdx.x; i < cols; i += stepCol) {
            float gf = stableSigmoid(xWrow[i] + sUrow[i] + b[i]);
            int k = i + cols;
            float gi = stableSigmoid(xWrow[k] + sUrow[k] + b[k]);
            int l = i + 2 * cols;
            float gc = tanhf(xWrow[l] + sUrow[l] + b[l]);
            float adj = rowAdj[i];

            // Optimized condition checks by combining and minimizing out-of-bound checks
            if(outCell) rowOutCell[i] += (m * gf - m + 1) * adj;
            if(m) { // Factor out m to minimize conditional checks
                float dcdxf = rowCell[i] * gf * (1 - gf) * adj;
                float dcdb_i = gc * gi * (1 - gi) * adj;
                float dcdxc = gi * (1 - gc * gc) * adj;

                if(outXW) {
                    rowOutXW[i] += dcdxf;
                    rowOutXW[k] += dcdb_i;
                    rowOutXW[l] += dcdxc;
                }
                if(outSU) {
                    rowOutSU[i] += dcdxf;
                    rowOutSU[k] += dcdb_i;
                    rowOutSU[l] += dcdxc;
                }
                if(outB) {
                    atomicAdd(outB + i, dcdxf);
                    atomicAdd(outB + k, dcdb_i);
                    atomicAdd(outB + l, dcdxc);
                }
            }
        }
    }
}