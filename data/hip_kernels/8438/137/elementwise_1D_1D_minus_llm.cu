```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_minus(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling for improved performance
    for (; tid + 3 < size; tid += stride * 4) {
        out[tid] = in1[tid] - in2[tid];
        out[tid + 1] = in1[tid + 1] - in2[tid + 1];
        out[tid + 2] = in1[tid + 2] - in2[tid + 2];
        out[tid + 3] = in1[tid + 3] - in2[tid + 3];
    }

    // Handle remaining elements
    for (; tid < size; tid += stride) {
        out[tid] = in1[tid] - in2[tid];
    }
}