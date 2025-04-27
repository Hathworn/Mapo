```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_pi(float *sum, int nbin, float step, int nthreads, int nBLOCKS) {
    // Use shared memory for reduction
    extern __shared__ float shared_sum[];
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Sequential thread index across the BLOCKS
    int tid = threadIdx.x;
    float x, local_sum = 0.0f;
    
    // Loop with striding across all blocks and threads
    for (int i = idx; i < nbin; i += nthreads * nBLOCKS) { 
        x = (i + 0.5f) * step;
        local_sum += 4.0f / (1.0f + x * x);
    }
    
    // Store local sum in shared memory
    shared_sum[tid] = local_sum;
    __syncthreads();
    
    // Reduce within block using shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_sum[tid] += shared_sum[tid + s];
        }
        __syncthreads();
    }
    
    // Write the result of the block sum to global memory
    if (tid == 0) {
        sum[blockIdx.x] = shared_sum[0];
    }
}