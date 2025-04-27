#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_f32(float* left_op, float* right_op, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds before accessing arrays
    if (idx >= len) return;

    // Compute product directly
    output[idx] = left_op[idx] * right_op[idx];
}