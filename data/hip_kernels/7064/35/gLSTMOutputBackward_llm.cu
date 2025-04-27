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

__global__ void gLSTMOutputBackward(float* outCell, float* outXW, float* outSU, float* outB, const float* cell, const float* xW, const float* sU, const float* b, const float* adj, size_t rows, size_t cols) {
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    // Ensure grid size is sufficient to process all rows
    if (j < rows) {
        // Calculate global memory locations for this row
        float* rowOutCell = outCell + j * cols;
        float* rowOutXW = outXW + j * cols * 4;
        float* rowOutSU = outSU + j * cols * 4;

        const float* rowCell = cell + j * cols;
        const float* xWrow = xW + j * cols * 4;
        const float* sUrow = sU + j * cols * 4;

        const float* rowAdj = adj + j * cols;

        int i = threadIdx.x;
        // Optimize loop by relying on parallel threads
        while (i < cols) {
            int k = i + 3 * cols;
            float go = stableLogit(xWrow[k] + sUrow[k] + b[k]);

            float t = tanhf(rowCell[i]);
            float adjVal = rowAdj[i];

            // dc/dc_{t-1}
            if (outCell)
                rowOutCell[i] += go * (1 - t * t) * adjVal;

            // dc/d(b_o) = dc/d(xW_f) ...
            float dcdxo = t * go * (1 - go) * adjVal;
            if (outXW)
                rowOutXW[k] += dcdxo;
            if (outSU)
                rowOutSU[k] += dcdxo;
            if (outB)
                atomicAdd(outB + k, dcdxo);

            i += blockDim.x; // Move to the next element within the row
        }
    }
}