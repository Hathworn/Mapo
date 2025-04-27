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

__global__ void gGRUFastForward(float* out, const float* state, const float* xW, const float* sU, const float* b, const float* mask, size_t rows, size_t cols, bool final) {
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    if(j < rows && i < cols) {
        float m = !mask || mask[j];
        float* rowOut = out + j * cols;
        const float* rowState = state + j * cols;

        const float* xWrow = xW + j * cols * 3;
        const float* sUrow = sU + j * cols * 3;

        float r = stableLogit(xWrow[i] + sUrow[i] + b[i]);
        int k = i + cols;
        float z = stableLogit(xWrow[k] + sUrow[k] + b[k]);
        int l = i + 2 * cols;

        float h = final ? tanhf(xWrow[l] + (sUrow[l] + b[l]) * r) : tanhf(xWrow[l] + sUrow[l] * r + b[l]);
        float curOut = (1.0f - z) * h + z * rowState[i];
        rowOut[i] = m * curOut + (1 - m) * rowState[i];
    }
}