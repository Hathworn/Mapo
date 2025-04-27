#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kWhere(float* condition_mat, float* if_mat, float* else_mat, float* target, unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Loop unrolling to increase throughput
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = condition_mat[i] ? if_mat[i] : else_mat[i];
    }
}