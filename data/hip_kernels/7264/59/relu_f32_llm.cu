#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_f32 (float* vector, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop for better performance
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < len; i += stride) {
        output[i] = vector[i] > 0.0f ? vector[i] : 0.0f;
    }
}