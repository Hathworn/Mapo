#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling for efficiency
    for (; tid + 3 < size; tid += 4 * stride) {
        out[tid] = in[tid] * in[tid];
        out[tid + stride] = in[tid + stride] * in[tid + stride];
        out[tid + 2 * stride] = in[tid + 2 * stride] * in[tid + 2 * stride];
        out[tid + 3 * stride] = in[tid + 3 * stride] * in[tid + 3 * stride];
    }

    // Process any remaining elements
    while (tid < size) {
        out[tid] = in[tid] * in[tid];
        tid += stride;
    }
}