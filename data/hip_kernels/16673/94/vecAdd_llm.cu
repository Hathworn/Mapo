#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float *in1, float *in2, float *out, int len) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    if (i < len) {
        out[i] = in1[i] + in2[i]; // Perform vector addition if within bounds
    }
}