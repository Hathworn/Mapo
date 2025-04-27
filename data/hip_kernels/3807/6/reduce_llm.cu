#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce(float* d_out, float* d_in) { // Parallel summation: steps = O(log(N)), work = O(N * log(N))
    extern __shared__ float sdata[];

    int globId = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x;

    // Reduce global memory access: load only if within bounds
    if (globId < gridDim.x * blockDim.x) {
        sdata[tid] = d_in[globId];
    } else {
        sdata[tid] = 0.0f; // Set to zero if out of bounds
    }
    __syncthreads();

    for (int s = blockDim.x >> 1; s > 0; s >>= 1) { // Unrolling loop for better performance
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}