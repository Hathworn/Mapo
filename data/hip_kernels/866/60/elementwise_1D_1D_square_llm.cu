#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling for performance optimization
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = in[tid] * in[tid];
        if (tid + stride < size) out[tid + stride] = in[tid + stride] * in[tid + stride];
        if (tid + 2 * stride < size) out[tid + 2 * stride] = in[tid + 2 * stride] * in[tid + 2 * stride];
        if (tid + 3 * stride < size) out[tid + 3 * stride] = in[tid + 3 * stride] * in[tid + 3 * stride];
    }
}