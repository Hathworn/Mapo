```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_f32(float* vector, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better performance
    if (idx < len) {
        output[idx] = vector[idx] * vector[idx];
    }
    if (idx + blockDim.x < len) {
        output[idx + blockDim.x] = vector[idx + blockDim.x] * vector[idx + blockDim.x];
    }
    if (idx + 2 * blockDim.x < len) {
        output[idx + 2 * blockDim.x] = vector[idx + 2 * blockDim.x] * vector[idx + 2 * blockDim.x];
    }
    if (idx + 3 * blockDim.x < len) {
        output[idx + 3 * blockDim.x] = vector[idx + 3 * blockDim.x] * vector[idx + 3 * blockDim.x];
    }
}