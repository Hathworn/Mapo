#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub_grad(float* in1_x, float* in1_d, float* in2_x, float* in2_d, float* out, int in1ScalarCount, int in2ScalarCount) {
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Process multiple elements per thread
    while (tid < in1ScalarCount) {
        int index = tid % in2ScalarCount;
        
        // Perform operations with reduced memory accesses
        float out_val = out[tid];
        in1_d[tid] += out_val * in2_x[index];
        in2_d[tid] = in1_x[tid] * out_val;  // Utilize registers for repeated values

        // Move to the next element this thread should process
        tid += stride;
    }
}