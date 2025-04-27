#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_i32 (int* left_op, int* right_op, int* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop to handle multiple elements per thread
    for (int i = idx; i < len; i += gridDim.x * blockDim.x) {
        output[i] = left_op[i] * right_op[i];
    }
}