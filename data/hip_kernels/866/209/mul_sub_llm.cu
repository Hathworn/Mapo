#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    // Using blockIdx.x, blockDim.x, and threadIdx.x to calculate unique thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Precompute grid stride
    int stride = blockDim.x * gridDim.x;
    
    // Use a grid-stride loop for better occupancy and workload distribution
    while (tid < in1ScalarCount) {
        out[tid] = in1[tid] * in2[tid % in2ScalarCount];
        tid += stride;
    }
}