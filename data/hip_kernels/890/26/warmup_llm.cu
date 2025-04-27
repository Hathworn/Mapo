#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *input, float *output) {
    const int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform computation if within bounds (optional boundary check for safety)
    if (i < gridDim.x * blockDim.x) {
        output[i] = input[i] * input[i];
    }
}