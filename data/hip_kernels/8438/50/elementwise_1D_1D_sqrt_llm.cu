#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Unrolling loop to improve performance
    for (; tid + 3 < size; tid += stride * 4) {
        out[tid] = sqrt(in[tid]);
        out[tid + 1] = sqrt(in[tid + 1]);
        out[tid + 2] = sqrt(in[tid + 2]);
        out[tid + 3] = sqrt(in[tid + 3]);
    }
    // Handle remaining elements
    for (; tid < size; tid += stride) {
        out[tid] = sqrt(in[tid]);
    }
}