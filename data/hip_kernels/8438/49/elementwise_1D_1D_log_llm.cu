#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll the loop to improve performance
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = log(in[tid]);
        if (tid + stride < size) out[tid + stride] = log(in[tid + stride]);
        if (tid + 2 * stride < size) out[tid + 2 * stride] = log(in[tid + 2 * stride]);
        if (tid + 3 * stride < size) out[tid + 3 * stride] = log(in[tid + 3 * stride]);
    }
}