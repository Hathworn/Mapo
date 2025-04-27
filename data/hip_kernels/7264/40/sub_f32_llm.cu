#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub_f32(float* left_op, float* right_op, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficiently handle boundary condition
    if (idx < len) {
        output[idx] = left_op[idx] - right_op[idx];
    }
}