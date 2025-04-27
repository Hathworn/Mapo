#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shmem_reduce_kernel(float * d_out, const float * d_in)
{
    // Using extern shared memory for reduction
    extern __shared__ float sdata[];

    // Compute global indices
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Load from global to shared memory
    sdata[tid] = d_in[myId];
    __syncthreads(); // Ensure all loads are done

    // Unroll the last warp for better performance
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Sync after each step
    }

    if (tid < 32) {
        // Unrolling warp: no need for __syncthreads() within a warp
        if (blockDim.x >= 64) sdata[tid] += sdata[tid + 32];
        if (blockDim.x >= 32) sdata[tid] += sdata[tid + 16];
        if (blockDim.x >= 16) sdata[tid] += sdata[tid + 8];
        if (blockDim.x >= 8)  sdata[tid] += sdata[tid + 4];
        if (blockDim.x >= 4)  sdata[tid] += sdata[tid + 2];
        if (blockDim.x >= 2)  sdata[tid] += sdata[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}