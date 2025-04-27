#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log_grad(float* in_x, float* in_d, float* out_x, float * out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Unroll the loop for improved performance
    for (; tid + 3 < size; tid += 4 * stride) {
        in_d[tid] += out_d[tid] / in_x[tid];
        in_d[tid + stride] += out_d[tid + stride] / in_x[tid + stride];
        in_d[tid + 2 * stride] += out_d[tid + 2 * stride] / in_x[tid + 2 * stride];
        in_d[tid + 3 * stride] += out_d[tid + 3 * stride] / in_x[tid + 3 * stride];
    }
    for (; tid < size; tid += stride) { // Handle remaining elements
        in_d[tid] += out_d[tid] / in_x[tid];
    }
}