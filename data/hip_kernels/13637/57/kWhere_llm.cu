#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kWhere(float* condition_mat, float* if_mat, float* else_mat, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with stride equal to total number of threads
    if (idx < len) {
        target[idx] = condition_mat[idx] ? if_mat[idx] : else_mat[idx];
    }
}