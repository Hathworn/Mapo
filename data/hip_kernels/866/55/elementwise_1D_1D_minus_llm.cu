#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_minus(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll the loop to reduce iterations and increase parallel execution
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) out[i] = in1[i] - in2[i];
        if (i + 1 < size) out[i + 1] = in1[i + 1] - in2[i + 1];
        if (i + 2 < size) out[i + 2] = in1[i + 2] - in2[i + 2];
        if (i + 3 < size) out[i + 3] = in1[i + 3] - in2[i + 3];
    }
}