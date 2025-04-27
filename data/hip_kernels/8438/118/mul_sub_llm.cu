#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Unroll the loop for better performance
    for (; tid + 3 * stride < in1ScalarCount; tid += 4 * stride) {
        out[tid] = in1[tid] * in2[tid % in2ScalarCount];
        out[tid + stride] = in1[tid + stride] * in2[(tid + stride) % in2ScalarCount];
        out[tid + 2 * stride] = in1[tid + 2 * stride] * in2[(tid + 2 * stride) % in2ScalarCount];
        out[tid + 3 * stride] = in1[tid + 3 * stride] * in2[(tid + 3 * stride) % in2ScalarCount];
    }
    
    // Handle remaining elements
    for (; tid < in1ScalarCount; tid += stride) {
        out[tid] = in1[tid] * in2[tid % in2ScalarCount];
    }
}