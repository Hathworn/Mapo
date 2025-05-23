#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use a larger stride to reduce loop overhead.
    for (; tid < in1ScalarCount; tid += stride) {
        out[tid] = in1[tid] * in2[tid % in2ScalarCount];
    }
}