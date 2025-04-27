#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void phshmem_reduce_kernel(float* d_out, const float* d_in) {
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load shared mem from global mem and handle boundary condition
    if (myId < gridDim.x * blockDim.x) {
        sdata[tid] = d_in[myId];
    } else {
        sdata[tid] = 0.0f;
    }
    __syncthreads();

    // Unroll the last warp for efficiency
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Perform work for the last warp without synchronization
    if (tid < 32) {
        volatile float* vsdata = sdata;
        vsdata[tid] += vsdata[tid + 32];
        vsdata[tid] += vsdata[tid + 16];
        vsdata[tid] += vsdata[tid + 8];
        vsdata[tid] += vsdata[tid + 4];
        vsdata[tid] += vsdata[tid + 2];
        vsdata[tid] += vsdata[tid + 1];
    }

    // Only thread 0 writes result for this block back to global memory
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}