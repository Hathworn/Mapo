#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(float* d_out, float* d_in) {
    extern __shared__ float sdata[];

    int globId = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x;

    // Load input into shared memory
    sdata[tid] = globId < blockDim.x * gridDim.x ? d_in[globId] : 0.0f; // Avoid reading out of bounds
    __syncthreads();

    // Perform log step reductions
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}