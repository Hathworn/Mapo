#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_pi(float *sum, int nbin, float step, int nthreads, int nblocks) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Sequential thread index across the blocks
    // Use shared memory for partial sums
    __shared__ float partial_sum[256];  // Assumes blockDim.x <= 256
    partial_sum[threadIdx.x] = 0.0f;

    for (int i = idx; i < nbin; i += nthreads * nblocks) {
        float x = (i + 0.5f) * step;
        partial_sum[threadIdx.x] += 4.0f / (1.0f + x * x);
    }
    
    // Synchronize threads in the block to ensure partial sums are written
    __syncthreads();
    
    // Reduce partial sums from all threads in the block
    if (threadIdx.x == 0) {
        float block_sum = 0.0f;
        for (int i = 0; i < blockDim.x; i++) {
            block_sum += partial_sum[i];
        }
        atomicAdd(sum, block_sum);  // Atomic add to global sum
    }
}