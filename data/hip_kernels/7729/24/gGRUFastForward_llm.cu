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

__global__ void gGRUFastForward(float* out, const float* state, const float* xW, const float* sU, const float* b, const float* mask, size_t rows, size_t cols, bool final) {
    // Assign unique thread and block IDs
    int j = blockIdx.x;
    int i = threadIdx.x;

    if (j < rows) {
        float m = !mask || mask[j];
        float* rowOut = out + j * cols;
        const float* rowState = state + j * cols;

        const float* xWrow = xW + j * cols * 3;
        const float* sUrow = sU + j * cols * 3;

        if (i < cols) {
            // Compute helper indices for the GRU components
            int k = i + cols;
            int l = i + 2 * cols;

            // Compute gate and candidate activations
            float r = stableSigmoid(xWrow[i] + sUrow[i] + b[i]);
            float z = stableSigmoid(xWrow[k] + sUrow[k] + b[k]);
            
            float h;
            if (final)
                h = tanhf(xWrow[l] + (sUrow[l] + b[l]) * r);
            else
                h = tanhf(xWrow[l] + sUrow[l] * r + b[l]);

            // Compute the output
            float out = (1.0f - z) * h + z * rowState[i];
            rowOut[i] = m * out + (1 - m) * rowState[i];
        }
    }
}