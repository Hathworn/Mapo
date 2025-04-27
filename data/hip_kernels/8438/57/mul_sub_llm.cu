#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    int in2Idx = tid % in2ScalarCount; // Initialize index for in2 to avoid recalculating
    for (; tid < in1ScalarCount; tid += stride, in2Idx = tid % in2ScalarCount) {
        out[tid] = in1[tid] * in2[in2Idx];
    }
}