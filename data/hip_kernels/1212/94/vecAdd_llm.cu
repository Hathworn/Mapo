#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd(float *in1, float *in2, float *out, int len) {
    // Calculate global thread ID
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Perform unrolling for better memory access
    int stride = gridDim.x * blockDim.x;
    for (; i < len; i += stride) {
        out[i] = in1[i] + in2[i];
    }
}