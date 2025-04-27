#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tanhDeriv_f32(float* vector, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        // Optimize redundant operations and improve readability
        float tmp = fabsf(vector[idx]);
        float denom = 1.0f + tmp;
        output[idx] = 1.0f / (denom * denom);
    }
}