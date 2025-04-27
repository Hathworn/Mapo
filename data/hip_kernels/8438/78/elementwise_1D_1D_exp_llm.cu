#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (tid < size) { // Check if thread index is within bounds
        out[tid] = exp(in[tid]); // Perform computation if within bounds
    }
}