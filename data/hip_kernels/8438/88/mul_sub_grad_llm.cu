#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_sub_grad(float* in1_x, float* in1_d, float* in2_x, float* in2_d, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Loop unrolling for better performance
    for (; tid < in1ScalarCount; tid += stride*4) {
        int index1 = tid % in2ScalarCount;
        in1_d[tid] += out[tid] * in2_x[index1];
        in2_d[tid] = in1_x[tid] * out[tid];
        
        // Unroll next iterations
        if (tid + stride < in1ScalarCount) {
            int index2 = (tid + stride) % in2ScalarCount;
            in1_d[tid + stride] += out[tid + stride] * in2_x[index2];
            in2_d[tid + stride] = in1_x[tid + stride] * out[tid + stride];
        }
        
        if (tid + 2*stride < in1ScalarCount) {
            int index3 = (tid + 2*stride) % in2ScalarCount;
            in1_d[tid + 2*stride] += out[tid + 2*stride] * in2_x[index3];
            in2_d[tid + 2*stride] = in1_x[tid + 2*stride] * out[tid + 2*stride];
        }
        
        if (tid + 3*stride < in1ScalarCount) {
            int index4 = (tid + 3*stride) % in2ScalarCount;
            in1_d[tid + 3*stride] += out[tid + 3*stride] * in2_x[index4];
            in2_d[tid + 3*stride] = in1_x[tid + 3*stride] * out[tid + 3*stride];
        }
    }
}