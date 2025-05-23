#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sub_i32 (int* left_op, int* right_op, int* output, int len) {
int idx = blockIdx.x * blockDim.x + threadIdx.x;
if (idx < len) {
output[idx] = left_op[idx] - right_op[idx];
}
}