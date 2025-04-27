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
    int j = blockIdx.x + blockIdx.y * gridDim.x; // Combine grid dimensions for more flexibility
    if(j < rows) {
        float m = !mask || mask[j];
        float* rowOut = out + j * cols;
        const float* rowState = state + j * cols;
        const float* xWrow = xW + j * cols * 3;
        const float* sUrow = sU + j * cols * 3;
        
        int stride = blockDim.x * blockDim.y; // Ensure wide coverage of threads
        for(int i = threadIdx.x + threadIdx.y * blockDim.x; i < cols; i += stride) {
            float r = stableLogit(xWrow[i] + sUrow[i] + b[i]);
            
            int k = i + cols;
            float z = stableLogit(xWrow[k] + sUrow[k] + b[k]);
            
            int l = i + 2 * cols;
            float h;
            if(final)
                h = tanhf(xWrow[l] + (sUrow[l] + b[l]) * r);
            else
                h = tanhf(xWrow[l] + sUrow[l] * r + b[l]);
            
            float outVal = (1.0f - z) * h + z * rowState[i];
            rowOut[i] = m * outVal + (1 - m) * rowState[i];
        }
    }
}