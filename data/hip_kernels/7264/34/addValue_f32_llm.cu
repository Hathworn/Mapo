#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addValue_f32 (float* __restrict__ vector, float value, float* __restrict__ output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        // Perform addition and assign the result
        output[idx] = vector[idx] + value;
    }
}