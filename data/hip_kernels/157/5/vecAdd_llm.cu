#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float *in1, float *in2, float *out, int len) {
    // Calculate global thread ID and ensure within bounds
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < len) {
        out[i] = in1[i] + in2[i]; // Vector addition
    }
}