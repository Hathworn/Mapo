#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_i32 (int* left_op, int* right_op, int* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop to handle cases where total threads are less than length
    for(int i = idx; i < len; i += blockDim.x * gridDim.x) {
        output[i] = left_op[i] + right_op[i];
    }
}