#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

__global__ void reduce_sum_final(const float* x, float* y, unsigned int len) {
    // Use shared memory for partial sum
    __shared__ float partial_sum[256];
    
    int tid = threadIdx.x;
    int global_tid = blockIdx.x * blockDim.x + tid;
    
    // Initialize shared memory
    float sum = 0.0f;
    for (int i = global_tid; i < len; i += blockDim.x * gridDim.x) {
        sum += x[i];
    }
    
    // Store each thread's sum in shared memory
    partial_sum[tid] = sum;
    __syncthreads();
    
    // Reduce within block
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            partial_sum[tid] += partial_sum[tid + s];
        }
        __syncthreads();
    }
    
    // Add block's sum to the final result
    if (tid == 0) {
        atomicAdd(y, partial_sum[0]);
    }
}