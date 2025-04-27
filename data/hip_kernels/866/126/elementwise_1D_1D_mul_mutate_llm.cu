#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_mul_mutate(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling to reduce iteration overhead
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] += in1[tid] * in2[tid];
        if (tid + 1 < size) out[tid + 1] += in1[tid + 1] * in2[tid + 1];
        if (tid + 2 < size) out[tid + 2] += in1[tid + 2] * in2[tid + 2];
        if (tid + 3 < size) out[tid + 3] += in1[tid + 3] * in2[tid + 3];
    }
}