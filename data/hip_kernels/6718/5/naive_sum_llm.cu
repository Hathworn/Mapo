#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void warpReduce(volatile float *sdata, int tid) {
    // Unrolled loop for warp-level reduction
    sdata[tid] += sdata[tid + 32];
    sdata[tid] += sdata[tid + 16];
    sdata[tid] += sdata[tid + 8];
    sdata[tid] += sdata[tid + 4];
    sdata[tid] += sdata[tid + 2];
    sdata[tid] += sdata[tid + 1];
}

__global__ void naive_sum(float *input, int size, float *out) {
    const unsigned int tid = threadIdx.x;
    const unsigned int bid = blockIdx.x * blockDim.x * 2 + tid;
    extern __shared__ float sdata[];

    if (!(bid < size)) return;

    // Load input into shared memory and do first level of reduction
    sdata[tid] = input[bid] + ((bid + blockDim.x < size) ? input[bid + blockDim.x] : 0);
    __syncthreads();

    // Reduce within the block using a loop
    for (unsigned int offset = blockDim.x / 2; offset > 32; offset /= 2) {
        if (tid < offset) {
            sdata[tid] += sdata[tid + offset];
        }
        __syncthreads();
    }

    // Perform warp-level reduction
    if (tid < 32) warpReduce(sdata, tid);

    // Write result for this block to global output
    if (tid == 0) out[blockIdx.x] = sdata[0];
}