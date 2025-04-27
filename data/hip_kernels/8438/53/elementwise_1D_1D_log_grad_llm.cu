#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling to improve performance by reducing loop overhead
    for (; tid + 4 <= size; tid += stride * 4) {
        in_d[tid] += out_d[tid] / in_x[tid];
        in_d[tid + 1] += out_d[tid + 1] / in_x[tid + 1];
        in_d[tid + 2] += out_d[tid + 2] / in_x[tid + 2];
        in_d[tid + 3] += out_d[tid + 3] / in_x[tid + 3];
    }

    // Handle remaining elements
    for (; tid < size; tid += stride) {
        in_d[tid] += out_d[tid] / in_x[tid];
    }
}