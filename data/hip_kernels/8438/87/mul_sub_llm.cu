#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Eliminate stride-based loop by leveraging kernel launch configuration
    if (tid < in1ScalarCount) {
        // Perform multiplication and subtraction
        out[tid] = in1[tid] * in2[tid % in2ScalarCount];
    }
}