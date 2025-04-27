#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    int in2Idx;  // Declare variable outside loop for reused index calculation

    // Use loop unrolling for improved performance
    for (; tid < in1ScalarCount; tid += stride * 4) {
        in2Idx = tid % in2ScalarCount;
        if (tid < in1ScalarCount) 
            out[tid] = in1[tid] * in2[in2Idx];
        if (tid + stride < in1ScalarCount) 
            out[tid + stride] = in1[tid + stride] * in2[(tid + stride) % in2ScalarCount];
        if (tid + 2 * stride < in1ScalarCount) 
            out[tid + 2 * stride] = in1[tid + 2 * stride] * in2[(tid + 2 * stride) % in2ScalarCount];
        if (tid + 3 * stride < in1ScalarCount) 
            out[tid + 3 * stride] = in1[tid + 3 * stride] * in2[(tid + 3 * stride) % in2ScalarCount];
    }
}