#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub_grad(float* in1_x, float* in1_d, float* in2_x, float* in2_d, float* out, int in1ScalarCount, int in2ScalarCount) {
    // Calculate thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid stride loop for better utilization
    int stride = gridDim.x * blockDim.x;
    while (tid < in1ScalarCount) {
        int index = tid % in2ScalarCount;
        
        // Accumulate results for in1_d and in2_d
        in1_d[tid] += out[tid] * in2_x[index];
        in2_d[tid] = in1_x[tid] * out[tid];
        
        tid += stride;
    }
}