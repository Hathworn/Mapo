#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use a while loop for potentially fewer instructions
    while (tid < in1ScalarCount) {
        out[tid] = in1[tid] * in2[tid % in2ScalarCount];
        tid += stride;
    }
}