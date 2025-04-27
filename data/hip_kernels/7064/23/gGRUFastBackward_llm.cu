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

__global__ void gGRUFastBackward(float* outState, float* outXW, float* outSU, float* outB,
                                 const float* state, const float* xW, const float* sU,
                                 const float* b, const float* mask, const float* adj,
                                 size_t rows, size_t cols, bool final) {
    int j = blockIdx.x;
    if(j < rows) {
        float m = !mask || mask[j];

        float* rowOutState = outState + j * cols;
        float* rowOutXW = outXW + j * cols * 3;
        float* rowOutSU = outSU + j * cols * 3;

        const float* rowState = state + j * cols;
        const float* rowXW = xW + j * cols * 3;
        const float* rowSU = sU + j * cols * 3;
        const float* rowAdj = adj + j * cols;

        int i = threadIdx.x;
        if(i < cols) {
            int k = i + cols;
            int l = i + 2 * cols;

            float r = stableLogit(rowXW[i] + rowSU[i] + b[i]);
            float z = stableLogit(rowXW[k] + rowSU[k] + b[k]);

            float h;
            if(final)
                h = tanhf(rowXW[l] + (rowSU[l] + b[l]) * r);
            else
                h = tanhf(rowXW[l] + rowSU[l] * r + b[l]);

            float adj = rowAdj[i];

            float t = (1 - z) * (1 - h * h);

            // df/ds
            if(outState)
                rowOutState[i] += (m * z - m + 1) * adj;

            // df/d(xW_r) ...
            float dfdxW_r = m * r * (1 - r) * t * adj;
            dfdxW_r *= final ? rowSU[l] + b[l] : rowSU[l];
            if(outXW)
                rowOutXW[i] += dfdxW_r;
            if(outSU)
                rowOutSU[i] += dfdxW_r;
            if(outB)
                atomicAdd(outB + i, dfdxW_r);

            // df/d(xW_z) ...
            float dfdxW_z = m * (1 - z) * z * (rowState[i] - h) * adj;
            if(outXW)
                rowOutXW[k] += dfdxW_z;
            if(outSU)
                rowOutSU[k] += dfdxW_z;
            if(outB)
                atomicAdd(outB + k, dfdxW_z);

            // df/d(xW_x) ...
            float dfdxW_x = m * t * adj;
            if(outXW)
                rowOutXW[l] += dfdxW_x;
            if(outSU)
                rowOutSU[l] += dfdxW_x * r;
            if(outB)
                atomicAdd(outB + l, final ? dfdxW_x * r : dfdxW_x);
        }
    }
}