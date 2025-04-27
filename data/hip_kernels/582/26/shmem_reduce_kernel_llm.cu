#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shmem_reduce_kernel(float *d_out, const float *d_in)
{
    // Allocate shared memory
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load shared memory from global memory
    sdata[tid] = d_in[myId];
    __syncthreads(); // Synchronize to ensure the entire block is loaded

    // Unroll reduction loop for better performance
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Synchronize at each stage
    }

    // Reduction for the last warp without synchronization
    if (tid < 32) {
        volatile float *vsdata = sdata;
        vsdata[tid] += vsdata[tid + 32];
        vsdata[tid] += vsdata[tid + 16];
        vsdata[tid] += vsdata[tid + 8];
        vsdata[tid] += vsdata[tid + 4];
        vsdata[tid] += vsdata[tid + 2];
        vsdata[tid] += vsdata[tid + 1];
    }

    // Write result for this block back to global memory
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}