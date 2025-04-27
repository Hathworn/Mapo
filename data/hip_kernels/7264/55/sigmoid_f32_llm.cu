#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid_f32 (float* vector, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds and compute sigmoid in an optimized way
    if (idx < len) {
        float tmp = vector[idx];
        float exp_tmp = expf(-fabsf(tmp)); // Use optimized exp and fabs functions
        float denom = 1.0f + exp_tmp;
        output[idx] = 0.5f * exp_tmp / denom;
    }
}