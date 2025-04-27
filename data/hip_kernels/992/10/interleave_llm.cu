#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void interleave(float* input, float* output, int size) {
    // Calculate stride up front
    const int stride = blockDim.x * gridDim.x;

    // Simplified loop condition and increment logic
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < size; i += stride) {
        output[2 * i] = input[i];
        output[2 * i + 1] = input[size + 2 + i];
    }
}