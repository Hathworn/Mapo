#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_minus(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Unroll loop to improve performance
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = in1[tid] - in2[tid];
        if (tid + stride < size) out[tid + stride] = in1[tid + stride] - in2[tid + stride];
        if (tid + stride * 2 < size) out[tid + stride * 2] = in1[tid + stride * 2] - in2[tid + stride * 2];
        if (tid + stride * 3 < size) out[tid + stride * 3] = in1[tid + stride * 3] - in2[tid + stride * 3];
    }
}