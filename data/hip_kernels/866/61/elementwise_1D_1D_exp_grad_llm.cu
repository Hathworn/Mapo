#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll the loop for improved hardware utilization
    for (; tid < size; tid += stride * 4) {
        if (tid < size) in_d[tid] += out_d[tid] * out_x[tid];
        if (tid + stride < size) in_d[tid + stride] += out_d[tid + stride] * out_x[tid + stride];
        if (tid + 2 * stride < size) in_d[tid + 2 * stride] += out_d[tid + 2 * stride] * out_x[tid + 2 * stride];
        if (tid + 3 * stride < size) in_d[tid + 3 * stride] += out_d[tid + 3 * stride] * out_x[tid + 3 * stride];
    }
}