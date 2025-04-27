#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Use unrolled loop to optimize memory access
    for (; tid + 3 < size; tid += stride * 4) {
        out[tid] = in[tid] * in[tid];
        out[tid + 1] = in[tid + 1] * in[tid + 1];
        out[tid + 2] = in[tid + 2] * in[tid + 2];
        out[tid + 3] = in[tid + 3] * in[tid + 3];
    }
    // Handle remaining elements
    for (; tid < size; tid += stride) {
        out[tid] = in[tid] * in[tid];
    }
}