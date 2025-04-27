#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_div(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Unrolling the loop to improve performance
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) out[i] = in1[i] / in2[i];
        if ((i + stride) < size) out[i + stride] = in1[i + stride] / in2[i + stride];
        if ((i + 2 * stride) < size) out[i + 2 * stride] = in1[i + 2 * stride] / in2[i + 2 * stride];
        if ((i + 3 * stride) < size) out[i + 3 * stride] = in1[i + 3 * stride] / in2[i + 3 * stride];
    }
}