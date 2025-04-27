#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_f32(float* left_op, float* right_op, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate total number of threads in grid
    for (int i = idx; i < len; i += stride) { // Use loop to continue processing in strides
        output[i] = left_op[i] + right_op[i];
    }
}