```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_mul(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling for better performance
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) out[i] = in1[i] * in2[i];
        if (i + stride < size) out[i + stride] = in1[i + stride] * in2[i + stride];
        if (i + stride * 2 < size) out[i + stride * 2] = in1[i + stride * 2] * in2[i + stride * 2];
        if (i + stride * 3 < size) out[i + stride * 3] = in1[i + stride * 3] * in2[i + stride * 3];
    }
}