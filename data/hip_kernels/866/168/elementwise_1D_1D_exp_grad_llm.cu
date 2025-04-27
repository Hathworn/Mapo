#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Unroll loop to increase memory access throughput
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) in_d[i] += out_d[i] * out_x[i];
        if (i + stride < size) in_d[i + stride] += out_d[i + stride] * out_x[i + stride];
        if (i + 2 * stride < size) in_d[i + 2 * stride] += out_d[i + 2 * stride] * out_x[i + 2 * stride];
        if (i + 3 * stride < size) in_d[i + 3 * stride] += out_d[i + 3 * stride] * out_x[i + 3 * stride];
    }
}