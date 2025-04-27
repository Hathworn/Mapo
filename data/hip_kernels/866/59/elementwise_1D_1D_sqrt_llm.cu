#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loop for better performance
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = sqrt(in[tid]);
        if (tid + stride < size) out[tid + stride] = sqrt(in[tid + stride]);
        if (tid + 2 * stride < size) out[tid + 2 * stride] = sqrt(in[tid + 2 * stride]);
        if (tid + 3 * stride < size) out[tid + 3 * stride] = sqrt(in[tid + 3 * stride]);
    }
}