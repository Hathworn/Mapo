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

__global__ void gLSTMCellBackward(float* outCell, float* outXW, float* outSU, float* outB, const float* cell, const float* xW, const float* sU, const float* b, const float* mask, const float* adj, size_t rows, size_t cols) {
    int j = blockIdx.x + blockIdx.y * gridDim.x; // Utilize 2D grid for better scalability
    if (j < rows) {
        int i = threadIdx.x;
        
        float m = !mask || mask[j];
        
        float* rowOutCell = outCell + j * cols;
        float* rowOutXW = outXW + j * cols * 4;
        float* rowOutSU = outSU + j * cols * 4;
        
        const float* rowCell = cell + j * cols;
        const float* xWrow = xW + j * cols * 4;
        const float* sUrow = sU + j * cols * 4;
        
        const float* rowAdj = adj + j * cols;

        while (i < cols) { // Utilize while loop for iteration
            float gf = stableLogit(xWrow[i] + sUrow[i] + b[i]);
            int k = i + cols;
            float gi = stableLogit(xWrow[k] + sUrow[k] + b[k]);
            int l = i + 2 * cols;
            float gc = tanhf(xWrow[l] + sUrow[l] + b[l]);
            
            float adjValue = rowAdj[i];

            if (outCell)
                rowOutCell[i] += (m * gf - m + 1) * adjValue;

            float dcdxf = m * rowCell[i] * gf * (1 - gf) * adjValue;
            if (outXW)
                rowOutXW[i] += dcdxf;
            if (outSU)
                rowOutSU[i] += dcdxf;
            if (outB)
                atomicAdd(outB + i, dcdxf);

            float dcdb_i = m * gc * gi * (1 - gi) * adjValue;
            if (outXW)
                rowOutXW[k] += dcdb_i;
            if (outSU)
                rowOutSU[k] += dcdb_i;
            if (outB)
                atomicAdd(outB + k, dcdb_i);

            float dcdxc = m * gi * (1 - gc * gc) * adjValue;
            if (outXW)
                rowOutXW[l] += dcdxc;
            if (outSU)
                rowOutSU[l] += dcdxc;
            if (outB)
                atomicAdd(outB + l, dcdxc);

            i += blockDim.x; // Thread-level parallelism
        }
    }
}