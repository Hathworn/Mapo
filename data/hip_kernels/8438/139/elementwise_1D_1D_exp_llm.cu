#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll the loop for better performance
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = exp(in[tid]);
        if (tid + stride < size) out[tid + stride] = exp(in[tid + stride]);
        if (tid + 2 * stride < size) out[tid + 2 * stride] = exp(in[tid + 2 * stride]);
        if (tid + 3 * stride < size) out[tid + 3 * stride] = exp(in[tid + 3 * stride]);
    }
}