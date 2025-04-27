#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefixsum_combine(float* in, int in_length, float* out, int out_length) {

    // Use shared memory to reduce global memory loads
    extern __shared__ float shared[];
    
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x;

    // Load data to shared memory
    if (tid < in_length) {
        shared[tid] = in[tid];
    }
    __syncthreads();
    
    // Only proceed if within bounds
    if (idx < out_length && blockIdx.x > 0) {
        out[idx] += shared[blockIdx.x - 1]; // Reduce global memory access
    }
}